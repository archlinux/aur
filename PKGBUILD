# Maintainer: Mitch Bigelow <ipha00@gmail.com>
# Contributor: delta48 <dark.magician.48[at]gmail[dot]com>

pkgname=pixiewps-git
_pkgname=pixiewps
pkgver=r21.c849ad1
pkgrel=1
pkgdesc="Offline bruteforce of the WPS pin exploiting the low or non-existing entropy of some APs"
arch=('i686' 'x86_64')
url="https://github.com/wiire/pixiewps"
license=('GPL')
depends=('openssl')
source=(git+https://github.com/wiire/pixiewps.git)
#source=(https://github.com/wiire/pixiewps/archive/v$pkgver.tar.gz)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"/src/
	sed -e 14,15d -e '16 s/m/D&/'  -i Makefile
	make
}

package() {
	cd "$_pkgname"/src
	make PREFIX="$pkgdir/usr" install
}
