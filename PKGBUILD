# Maintainer: IKRadulov <ikradulov@vivaldi.net> 
# Contributors:

_makecores=1
_ver=1.15
_pkgbase=mate-netbook
pkgname="${_pkgbase}-${_ver}-gtk3"
pkgver=${_ver}.1
pkgrel=2
pkgdesc="Mate netbook utilities"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL' 'LGPL')
depends=('gtk3' 'libfakekey' 'libwnck3' 'libunique3' 'mate-panel-1.15-gtk3')
makedepends=('mate-common')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('699de846c9e7f4fe435691e73ca27ecd55f192ec')
install=mate-netbook.install

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --with-gtk=3.0 \
        --disable-static \
        --disable-schemas-compile
    make -j${_makecores}
}

package() {
    pkgdesc+=' (GTK3 version)'
    groups=('mate')
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
