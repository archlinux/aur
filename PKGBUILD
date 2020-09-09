# Maintainer: Mikołaj Lercher <bandithedoge@protonmail.com>

_pkgname='finalhe'
pkgname=${_pkgname}-git
pkgver=1.92.r7.g624b8eb
pkgrel=2
pkgdesc="A tool to push h-encore exploit for PS VITA/PS TV automatically"
arch=('x86_64')
url="https://github.com/soarqin/${_pkgname}"
license=('GPL')
depends=('libxml2' 'libusb' 'zlib' 'qt5-base')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$pkgname::git+https://github.com/soarqin/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed -r 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
    cd "$pkgname"
    qmake
	make
    cd "src"
    make lcopy
}

package() {
    cd "$pkgname"
    install -Dm755 src/FinalHE "$pkgdir/usr/bin/finalhe"
    install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
