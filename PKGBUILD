# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-messages"
pkgver="0.6.0"
pkgrel="1"
pkgdesc="indicator that collects messages that need a response"
arch=("i686" "x86_64")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("dconf" "libayatana-indicator-gtk3" "accountsservice" "glib2" "hicolor-icon-theme")
makedepends=("gobject-introspection" "gnome-common" "gtk-doc" "intltool" "accountsservice" "vala" "systemd")
source=("http://releases.ayatana-indicators.org/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=("b8c38939ade3414741c2a4b0ddbb045a")
options=("!emptydirs")

prepare()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    sed -i "s@PKG_CHECK_MODULES(DBUSTEST, dbustest-1)@@" configure.ac
    sed -i "s@AM_INIT_AUTOMAKE(subdir-objects)@AM_INIT_AUTOMAKE()@" configure.ac
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --libexecdir=/usr/lib --enable-gtk-doc --disable-tests --disable-static
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    find ${pkgdir}/usr/lib -name *.la -delete
}
