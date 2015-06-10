# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=copyq-plugin-itemweb-git
pkgver=20140126
pkgrel=1
pkgdesc="Clipboard manager with searchable and editable history. Itemweb plugin."
url="https://github.com/hluk/CopyQ"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qtwebkit' 'copyq-git')
makedepends=('cmake' 'git')
provides=('copyq-plugin-itemweb')
conflicts=('copyq-plugin-itemweb')
source=("${pkgname}::git+https://github.com/hluk/CopyQ.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
    mkdir -p ${srcdir}/${pkgname}/build
    cd ${srcdir}/${pkgname}/build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        ${srcdir}/${pkgname}
    make itemweb
}

package() {
    cd ${srcdir}/${pkgname}/build
    install -Dm755 plugins/libitemweb.so $pkgdir/usr/lib/copyq/plugins/libitemweb.so
    rm -rf ${srdir}/${pkgname}/build
}

# vim:set ts=4 sw=4 et:
