# Maintainer: Robert Tari <robert at tari dot in>

pkgname="mate-ayatana-indicator-applet"
_pkgnameorig="mate-indicator-applet"
pkgver="1.23.0"
pkgrel="1"
pkgdesc="MATE panel Ayatana indicator applet"
arch=("i686" "x86_64")
url="http://www.mate-desktop.org/"
license=("LGPL2.1" "GPL3")
depends=("mate-panel" "ayatana-ido" "libayatana-indicator-gtk3")
makedepends=("intltool" "gtk3" "ayatana-ido" "libayatana-indicator-gtk3" "libtool" "libx11" "libxml2" "mate-common")
optdepends=("ayatana-indicator-application" "ayatana-indicator-power" "ayatana-indicator-datetime" "ayatana-indicator-session" "ayatana-indicator-messages" "ayatana-indicator-keyboard")
source=("https://github.com/mate-desktop/${_pkgnameorig}/archive/v${pkgver}.tar.gz")
md5sums=("1b47cb29ce0ec17090b8f2abe57f5b88")
options=("!emptydirs")
provides=("${_pkgnameorig}")
conflicts=("${_pkgnameorig}")

prepare()
{
    cd ${srcdir}/${_pkgnameorig}-${pkgver}
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    cd ${srcdir}/${_pkgnameorig}-${pkgver}
    ./configure --prefix=/usr --disable-static --libexecdir=/usr/lib --with-ayatana-indicators=yes
    make
}

package()
{
    cd ${srcdir}/${_pkgnameorig}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
