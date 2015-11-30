# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: SanskritFritz (gmail)

pkgname=copyq-git
pkgver=20151130
pkgrel=1
pkgdesc="Clipboard manager with searchable and editable history."
url="https://github.com/hluk/CopyQ"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libxtst' 'qt5-script' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('copyq-plugin-itemweb-git')
makedepends=('cmake' 'git' 'qt5-tools' 'qt5-svg')
provides=('copyq')
conflicts=('copyq')
source=("${pkgname}::git+https://github.com/hluk/CopyQ.git")
md5sums=('SKIP')
install=copyq.install

pkgver() {
    cd ${srcdir}/${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
    mkdir -p ${srcdir}/${pkgname}/build
    cd ${srcdir}/${pkgname}/build
    cmake \
        -DWITH_WEBKIT=0 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_QT5=TRUE \
        ${srcdir}/${pkgname}
    make
}

package() {
    cd ${srcdir}/${pkgname}/build
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et:
