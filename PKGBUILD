# Maintainer: Alad Wenter <alad@mailbox.org>
# Contributor: Adam Reichold <adam.reichold@t-online.de>

pkgname=qpdfview
pkgver=0.4.18
pkgrel=2
pkgdesc='A tabbed PDF viewer using the poppler library.'
url='https://launchpad.net/qpdfview'
arch=('x86_64')
license=('GPL2')
depends=('libcups' 'libsynctex' 'poppler-qt5' 'qt5-svg')
makedepends=('qt5-tools' 'libspectre' 'djvulibre')
optdepends=('libspectre: for PostScript support'
            'djvulibre: for DjVu support')
source=("https://launchpad.net/qpdfview/trunk/$pkgver/+download/qpdfview-$pkgver.tar.gz"
        "https://launchpad.net/qpdfview/trunk/$pkgver/+download/qpdfview-$pkgver.tar.gz.asc"
        fix-gcc10-build.patch)
sha256sums=('cc642e7fa74029373ca9b9fbc29adc4883f8b455130a78ad54746d6844a0396c'
            'SKIP'
            '5314091e35031f5ebf38a827b64e524e2f5dab8a5c2d3c0e081fb7a634ebe301')
# Adam Reichold <adam.reichold@t-online.de>
validpgpkeys=('1F521FF0F87E9E1CDE46B8A9F4928C4DD24D4DF8')

prepare() {
    cd $pkgname-$pkgver
    sed -e 's|2.0.0|1.21.0|' -i application.pro
    patch -Np1 < ../fix-gcc10-build.patch
}

build() {
    cd $pkgname-$pkgver
    lrelease-qt5 qpdfview.pro
    qmake-qt5 qpdfview.pro
    make
}

package() {
    cd $pkgname-$pkgver
    make INSTALL_ROOT="$pkgdir" install
}

