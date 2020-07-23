# Maintainer: Guillaume Hayot <ghayot[at]postblue[dot]info>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="libayatana-appindicator"
pkgver="0.5.5"
pkgrel="1"
pkgdesc="Ayatana Application Indicators (Shared Library)"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/libayatana-appindicator"
license=("LGPL2.1" "LGPL3")
makedepends=("git" "gtk3" "glib2" "libayatana-indicator" "libdbusmenu-gtk3" "dbus-glib" "mate-common" "gobject-introspection")
depends=('libdbusmenu-gtk3' 'libayatana-indicator')
optdepends=("vala" "mono" "gtk-sharp-3")
source=("git+https://github.com/AyatanaIndicators/${pkgname}.git")
md5sums=("SKIP")
conflicts=("${pkgname}-gtk3")

prepare()
{
    cd ${pkgname}
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    export CSC="/usr/bin/mcs"
    cd ${pkgname}
    ./configure --prefix=/usr --enable-introspection --enable-gtk-doc=no --disable-tests --disable-mono-test --with-gtk=3
    make
}

package()
{
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}

