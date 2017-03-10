# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=streameye
pkgver=0.8
pkgrel=2
pkgdesc="A simple MJPEG streamer for Linux"
arch=("any")
url="https://github.com/ccrisan/streameye"
license=("GPL3")
depends=("python2" "python2-picamera")
makedepends=("git" "make" "gcc")
source=("https://github.com/ccrisan/streameye/archive/${pkgver}.tar.gz")
sha256sums=('6dbda8147ef2701ad57f816f3ecdcd72c4b31b12c286c7a2eed5405421a06dbf')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    # Change the default interpreter to python2
    sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|g' extras/raspimjpeg.py
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 755 streameye "${pkgdir}/usr/bin/streameye"
    install -Dm 755 extras/raspimjpeg.py "${pkgdir}/usr/bin/raspimjpeg.py"
}
