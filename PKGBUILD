# Maintainer:  kernel1024 <kernelonline at gmail dot com>

pkgname=qmanga-git
_pkgname=qmanga
pkgver=20220203.e1234c1
pkgrel=4
pkgdesc="Manga and book reader written with Qt"
arch=('i686' 'x86_64')
url="https://github.com/kernel1024/qmanga"
license=('GPL3')

depends=('qt6-base' 'libzip' 'zlib' 'poppler>=0.83.0' 'tbb')
optdepends=('djvulibre: DJVU files support'
            'tesseract: OCR support'
            'ebook-tools: EPUB support')

makedepends=('git')
source=("git+https://github.com/kernel1024/qmanga.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build () {
    cd "$srcdir/${_pkgname}"
    qmake6
    make
}

package () {
    cd "$srcdir/${_pkgname}"
    make INSTALL_ROOT="${pkgdir}" install
}
