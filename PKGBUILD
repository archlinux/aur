# Maintainer: SanskritFritz (gmail)

_pkgname=factropy
pkgname=$_pkgname-git
pkgver=r102.b52290f
pkgrel=1
pkgdesc='A hobby gamedev project heavily influenced by Factorio'
arch=('x86_64')
url='https://github.com/factropy/factropy'
license=('MIT')
depends=("libglvnd")
makedepends=("git")
source=("git+https://github.com/factropy/factropy.git" "factropy.sh")
md5sums=('SKIP' 'b77189e6385420fcc54dcbce0f77e25c')

pkgver() {
  cd $_pkgname
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make clean
	make linux2
}

package() {
	cd "$_pkgname"
	mkdir -p "$pkgdir/usr/"{bin,share/factropy}
	cp -r factropy assets models font shader scenario LICENSE README.md "$pkgdir/usr/share/factropy"
	cp "$srcdir/factropy.sh" "$pkgdir/usr/bin/factropy"
	chmod +x "$pkgdir/usr/bin/factropy"
}
