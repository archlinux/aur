# Maintainer: Jiří Klimeš <blueowl@centrum.cz>
# Contributor: Edoardo Brogiolo <edoardo@brogiolo.eu>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>

pkgname=pdf2djvu
pkgver=0.9.19
pkgrel=2
pkgdesc="Creates DjVu files from PDF files"
arch=('x86_64')
url="https://jwilk.net/software/pdf2djvu"
license=('GPL')
depends=('poppler' 'djvulibre' 'gcc-libs' 'graphicsmagick' 'exiv2')
makedepends=('ttf-liberation' 'boost')
checkdepends=('python-nose' 'poppler-data')
source=(
  "https://github.com/jwilk/pdf2djvu/releases/download/${pkgver}/pdf2djvu-${pkgver}.tar.xz"
  "pdf2djvu-tests-python-3.patch"
)
sha256sums=(
  'eb45a480131594079f7fe84df30e4a5d0686f7a8049dc7084eebe22acc37aa9a'
  'fe6f45c09dee733c7b96a68556e635a47e1faf69bb47aca35599dc6117d22dc2'
)

prepare() {
  # Migrate tests to Python 3
  # (It may not be ideal, but it works.)
  patch -p1 < "$srcdir"/pdf2djvu-tests-python-3.patch
}

build() {
    cd ${pkgname}-${pkgver}

    ./configure --prefix=/usr
    make
}

check() {
    cd ${pkgname}-${pkgver}

   make PYTHON=python test
}

package() {
    cd ${pkgname}-${pkgver}

    make install DESTDIR="${pkgdir}"
}
