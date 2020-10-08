# Maintainer: Robert Tari <robert at tari dot in>

pkgname="mate-indicator-applet"
pkgver="1.25.0"
pkgrel="1"
pkgdesc="Applet to display information from various applications consistently in the MATE panel (Built with Ayatana support)"
arch=("i686" "x86_64" "pentium4")
url="http://www.mate-desktop.org/"
license=("LGPL2.1" "GPL3")
depends=("mate-panel" "ayatana-ido" "libayatana-indicator")
makedepends=("autoconf-archive" "intltool" "gtk3" "ayatana-ido" "libayatana-indicator" "libtool" "libx11" "libxml2" "mate-common")
source=("https://github.com/mate-desktop/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=("ab125c672ea26172a55d8aefdee277c3")
options=("!emptydirs")

prepare()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --disable-static --libexecdir=/usr/lib --with-ayatana-indicators=yes
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}

