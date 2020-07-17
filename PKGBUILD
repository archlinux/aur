# Maintainer: Robert Tari <robert at tari dot in>

pkgname="mate-ayatana-indicator-applet"
_pkgnameorig="mate-indicator-applet"
pkgver="1.24.0"
pkgrel="1"
pkgdesc="MATE panel Ayatana indicator applet"
arch=("i686" "x86_64")
url="http://www.mate-desktop.org/"
license=("LGPL2.1" "GPL3")
depends=("mate-panel" "ayatana-ido" "libayatana-indicator")
makedepends=("intltool" "gtk3" "ayatana-ido" "libayatana-indicator" "libtool" "libx11" "libxml2" "mate-common")
optdepends=("ayatana-indicator-application" "ayatana-indicator-power" "ayatana-indicator-datetime" "ayatana-indicator-session" "ayatana-indicator-messages" "ayatana-indicator-keyboard")
source=("https://github.com/mate-desktop/${_pkgnameorig}/archive/v${pkgver}.tar.gz")
md5sums=("7aa54e5d2174193f935146e91286ca23")
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
