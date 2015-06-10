# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=copyq-plugin-itemweb
_realname=CopyQ
pkgver=2.4.7
pkgrel=1
pkgdesc="Clipboard manager with searchable and editable history. Itemweb plugin."
url="https://github.com/hluk/CopyQ"
depends=('qtwebkit' 'copyq')
makedepends=('cmake')
license=('GPL3')
arch=('i686' 'x86_64')
source=("https://github.com/hluk/$_realname/archive/v${pkgver}.tar.gz")
md5sums=('4215c5e3fc0c5bb050b79f07cfb88a20')

build() {
    mkdir "${srcdir}/build"
    cd "${srcdir}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        "${srcdir}/${_realname}-${pkgver}"
    make itemweb
}

package() {
    cd "${srcdir}/build"
    install -Dm755 plugins/libitemweb.so "${pkgdir}/usr/lib/copyq/plugins/libitemweb.so"
}

# vim:set ts=4 sw=4 et:
