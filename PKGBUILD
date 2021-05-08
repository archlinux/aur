# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=pdf2djvu
pkgver=0.9.17.1
pkgrel=9
pkgdesc="Creates DjVu files from PDF files"
arch=('x86_64')
url="https://jwilk.net/software/pdf2djvu"
license=('GPL')
depends=('poppler' 'djvulibre' 'gcc-libs' 'graphicsmagick' 'exiv2')
makedepends=('python2-nose' 'ttf-liberation' 'boost')
source=(https://github.com/jwilk/pdf2djvu/releases/download/${pkgver}/pdf2djvu-${pkgver}.tar.xz{,.asc})
sha256sums=('5bbbb7bdc7858a1eeac6ff270e5a323390f2abb6bd3b0b2ae08c1965272226a3'
            'SKIP')
validpgpkeys=('CDB5A1243ACDB63009AD07212D4EB3A6015475F5')

prepare() {
    cd ${pkgname}-${pkgver}

    # https://github.com/jwilk/pdf2djvu/issues/144
    sed -i 's/poppler-splash/poppler/' configure
}

build() {
    cd ${pkgname}-${pkgver}

    ./configure --prefix=/usr
    make
}

check() {
    cd ${pkgname}-${pkgver}

   make PYTHON=python2 test
}

package() {
    cd ${pkgname}-${pkgver}

    make install DESTDIR="${pkgdir}"
}
