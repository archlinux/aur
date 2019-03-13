# Maintainer: Robert Tari <robert at tari dot in>
# Contributor: Valentin Huélamo <vhuelamo at gmail dot com>

pkgname="ayatana-indicator-application"
pkgver="0.5.2"
pkgrel="3"
pkgdesc="Ayatana Application Indicators"
arch=("i686" "x86_64")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("libayatana-indicator-gtk3" "dbus-glib" "libayatana-appindicator-gtk3")
makedepends=("mate-common" "xorg-server-xvfb" "glib2" "gtk3" "dbus-glib" "json-glib" "intltool" "libayatana-appindicator-gtk3" "libayatana-indicator-gtk3" "libdbusmenu-glib" "libdbusmenu-gtk3" "systemd")
source=("http://releases.ayatana-indicators.org/source/${pkgname}/${pkgname}-${pkgver}.tar.gz" "0001-Make-systemd-optional.-If-systemd-is-not-available-a.patch")
md5sums=("15a5d17de624004cc814cc5d7b895478" "1b00c0fd21c28eff19297e40af3e5ed1")
options=("!emptydirs")

prepare()
{
    cd ${pkgname}-${pkgver}
    patch -Np1 -i ../0001-Make-systemd-optional.-If-systemd-is-not-available-a.patch
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr --libexecdir=/usr/lib
    make
}

package()
{
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
