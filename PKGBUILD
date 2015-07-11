# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=copyq
_realname=CopyQ
pkgver=2.4.8
pkgrel=1
pkgdesc="Clipboard manager with searchable and editable history."
url="https://github.com/hluk/CopyQ"
depends=('qt4' 'libxtst')
optdepends=('copyq-plugin-itemweb')
makedepends=('cmake')
license=('GPL3')
arch=('i686' 'x86_64')
source=("https://github.com/hluk/${_realname}/archive/v${pkgver}.tar.gz")
md5sums=('74de03d3d45def995330fa48a86bbd1e')
install=copyq.install

build() {
    mkdir "${srcdir}/build"
    cd "${srcdir}/build"
    cmake -DWITH_WEBKIT=0 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        "${srcdir}/${_realname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et:
