# Maintainer: Riley Ink <contact@riley.ink>
_pkgname=gophernicus
pkgname=${_pkgname}-git
pkgver=3.1.1.r46.gd5926c9
pkgrel=1
pkgdesc="Modern, full-featured gopher daemon"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/gophernicus/gophernicus.git"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'make' 'gcc')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd "${pkgname}"
    ./configure --prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin --gopherroot=/srv/gopher --listener=systemd --systemd=/usr/lib/systemd/system
    mv config.h src/config.h
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="$pkgdir" install
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm 644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
    install -Dm 644 README.gophermap $pkgdir/usr/share/doc/$pkgname/README.gophermap


}

