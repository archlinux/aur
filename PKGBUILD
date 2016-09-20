_ver=1.15
_pkgbase=mate-netbook
pkgname=${_pkgbase}-dev
pkgver=${_ver}.2
pkgrel=2
pkgdesc="A simple window management tool ."
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'libfakekey' 'libwnck3' 'libunique3' 
'mate-panel-dev>=1.15')
makedepends=('mate-common-dev' 'intltool')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
sha1sums=('5e09d4da8d934c6350d1a7e40b78fdf557e8edf4')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
    --prefix=/usr \
    --libexec=/usr/lib/${_pkgbase} \
    --sysconfdir=/etc \
    --disable-static \
    --disable-schemas-compile \
    --with-gtk=3.0 \
    --enable-gtk-doc
    
    make
}

package() {
    pkgdesc+=' (GTK3 version)'
    groups=('mate-extra-gtk3')
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
