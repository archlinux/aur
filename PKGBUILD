# Maintainer: Tomás Duarte <tomas@mustachedsquid.com>
_pkgname=gophernicus
pkgname=${_pkgname}-git
pkgver=r281.da33900
pkgrel=1
pkgdesc="Modern, full-featured gopher daemon"
arch=('any')
url="https://github.com/gophernicus/gophernicus.git"
license=('BSD')
depends=('glibc')
makedepends=('git' 'make' 'gcc')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
    cd "${pkgname}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="$pkgdir" install
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm 644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
    install -Dm 644 README.gophermap $pkgdir/usr/share/doc/$pkgname/README.gophermap


}

