# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgbase=xfconf
pkgname=(${_pkgbase}-gtk2)
pkgver=4.12.1
pkgrel=1
pkgdesc="A simple client-server configuration storage and query system (GTK2 version)"
arch=('x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
depends=('libxfce4util-gtk2' 'dbus-glib')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig' 'glib-perl'
             'intltool' 'chrpath')
options=('!emptydirs')
source=(https://archive.xfce.org/src/xfce/${_pkgbase}/${pkgver%.*}/${_pkgbase}-${pkgver}.tar.bz2)
sha256sums=('35f48564e5694faa54fdc180cd3268e16fc2352946a89a3c2fc12cbe400ada36')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/xfce4 \
        --localstatedir=/var \
        --disable-static \
        --with-perl-options=INSTALLDIRS="vendor" \
        --disable-debug
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    # Fix insecure rpath, http://bugs.archlinux.org/task/19980
    find "${pkgdir}" -name Xfconf.so -exec chrpath -d {} +
}

# vim:set ts=2 sw=2 et:
