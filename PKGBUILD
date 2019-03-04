# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-application"
pkgver="0.5.2"
pkgrel="1"
pkgdesc="Ayatana Application Indicators"
arch=("i686" "x86_64")
url="https://github.com/AyatanaIndicators"
license=("GPL2" "GPL3" "LGPL2.1" "LGPL3")
depends=("libayatana-appindicator-gtk3" "libayatana-indicator-gtk3" "dbus-glib" "libdbusmenu-gtk3" "glib2" "gtk3" "pango")
makedepends=("mate-common" "xorg-server-xvfb" "glib2" "gtk3" "dbus-glib" "json-glib" "intltool" "libayatana-appindicator-gtk3" "libayatana-indicator-gtk3" "libdbusmenu-glib" "libdbusmenu-gtk3" "systemd")
source=("http://releases.ayatana-indicators.org/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=("15a5d17de624004cc814cc5d7b895478")
options=("!emptydirs")

prepare()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    patch -Np1 -i ../../0001-Make-systemd-optional.-If-systemd-is-not-available-a.patch
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --libexecdir=/usr/lib
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
