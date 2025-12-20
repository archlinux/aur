# Maintainer: trilader <trilader@schroedingers-bit.net>
pkgname=m8c
pkgver=2.2.1
pkgrel=1
pkgdesc="A UI for the M8 and M8 Headless portable music DAWs"
arch=('x86_64')
url="https://github.com/laamaa/m8c"
license=('MIT')
depends=('sdl3' 'libserialport')
makedepends=()
checkdepends=()
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/laamaa/m8c/archive/refs/tags/v${pkgver}.tar.gz"
        "system-gamecontrollerdb.patch")
sha256sums=('3b17716a63ee3f28e20b59b59d73c25de9be5f228d3a858032d4c9a38c699ef2'
            '9bba2faf9512779b2a4e2ab022b7ed437e12490c332e2333707470a21f481589')

prepare() {
    cd $srcdir/$pkgname-$pkgver
    patch -p1 -i $srcdir/system-gamecontrollerdb.patch
}

build() {
    cd $srcdir/$pkgname-$pkgver
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make PREFIX=/usr DESTDIR=$pkgdir install
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 AUDIOGUIDE.md "${pkgdir}/usr/share/doc/${pkgname}/AUDIOGUIDE.md"
    install -Dm 644 gamecontrollerdb.txt "${pkgdir}/usr/share/${pkgname}/gamecontrollerdb.txt"
}



