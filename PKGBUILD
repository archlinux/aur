# Maintainer: Mitch Bigelow <ipha00@gmail.com>
# Contributor: delta48 <dark.magician.48+aur[at]gmail[dot]com>

pkgname=pixiewps-git
_pkgname=pixiewps
pkgver=r26.08a78c3
pkgrel=1
pkgdesc="Offline bruteforce of the WPS pin exploiting the low or non-existing entropy of some APs"
arch=('i686' 'x86_64')
url="https://github.com/wiire/pixiewps"
license=('GPL')
depends=('openssl')
makedepends=('git')
conflicts=('pixiewps')
provides=('pixiewps')
source=(git+https://github.com/wiire/pixiewps.git)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"/src/
	# edit makefile
	sed -e 14d -e 16d -e '15 s/install/& -Dm 755 /'  -i Makefile
	make
}

package() {
	cd "$_pkgname"/src
	make PREFIX="$pkgdir/usr" install
}
