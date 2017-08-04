# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.14
_pkgbase=mate-terminal
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.1
pkgrel=3
pkgdesc="The MATE Terminal Emulator (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsm' 'mate-desktop' 'vte')
makedepends=('intltool' 'itstool')
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz"
        exitcode.patch)
sha1sums=('092bee6c43910c2d038095c268979ea3f6fdd2ef'
          '6218f0c765725bbaf705afd6d7d7b0e2ff920f25')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    patch -Np1 -i "${srcdir}/exitcode.patch"
}

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --with-gtk=2.0
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
