# Maintainer: Robert Tari <robert at tari dot in>

pkgname="mate-indicator-applet"
pkgver="1.28.0"
pkgrel="1"
pkgdesc="Applet to display information from various applications consistently in the MATE panel (Built with Ayatana support)"
arch=("i686" "x86_64" "pentium4")
url="http://www.mate-desktop.org/"
license=("LGPL-2.1-or-later" "GPL-3.0-or-later")
makedepends=("autoconf-archive" "intltool" "libxml2" "mate-common")
depends=("mate-panel" "ayatana-ido" "libayatana-indicator" "gtk3" "hicolor-icon-theme" "glib2" "at-spi2-core" "libx11" "glibc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mate-desktop/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=("21cd423c82afd569beee4168dd2a0631")

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

