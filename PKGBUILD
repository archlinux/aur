# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

_pkgbase=libxfce4ui
pkgname=(${_pkgbase}-gtk2)
pkgver=4.14.1
pkgrel=1
pkgdesc="Commonly used Xfce widgets among Xfce applications (GTK2 version)"
arch=('x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
depends=('libxfce4util-gtk2' 'gtk2' 'gtk3' 'xfconf-gtk2' 'libsm' 'startup-notification'
         'hicolor-icon-theme')
makedepends=('intltool' 'gobject-introspection' 'vala')
source=(https://archive.xfce.org/src/xfce/${_pkgbase}/${pkgver%.*}/${_pkgbase}-${pkgver}.tar.bz2)
sha256sums=('c449075eaeae4d1138d22eeed3d2ad7032b87fb8878eada9b770325bed87f2da')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static \
        --disable-debug \
        --with-vendor-info='Arch Linux'
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
