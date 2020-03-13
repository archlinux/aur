# Maintainer:  kernel1024 <kernelonline at gmail dot com>

pkgname=qmanga-git
_pkgname=qmanga
pkgver=20200313.aee22c9
pkgrel=1
pkgdesc="Manga and book reader written with Qt"
arch=('i686' 'x86_64')
url="https://github.com/kernel1024/qmanga"
license=('GPL3')

depends=('qt5-base>=5.11.0' 'libzip' 'zlib' 'poppler>=0.72.0')
optdepends=('djvulibre: DJVU files support'
            'tesseract: OCR support')

makedepends=('git')
source=("git://github.com/kernel1024/qmanga.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build () {
    cd "$srcdir/${_pkgname}"
    qmake-qt5
    make
}

package () {
    cd "$srcdir/${_pkgname}"
    make INSTALL_ROOT="${pkgdir}" install
}
