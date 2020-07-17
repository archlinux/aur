# Maintainer: Guillaume Hayot <ghayot[at]postblue[dot]info>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="libayatana-appindicator"
pkgver="0.5.4"
pkgrel="1"
pkgdesc="Ayatana Application Indicators (Shared Library)"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/libayatana-appindicator"
license=("LGPL2.1" "LGPL3")
makedepends=("gtk3" "glib2" "libayatana-indicator-gtk3" "libdbusmenu-gtk3" "dbus-glib" "gtk-sharp-3" "mono" "vala" "mate-common" "gobject-introspection")
depends=('libdbusmenu-gtk3' 'libayatana-indicator-gtk3')
source=("https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver.tar.gz")
md5sums=("d9f2b6e269577e4e5141fb056e3ca6a3")
replaces=("${pkgbase}-gtk3")

prepare()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    export CSC="/usr/bin/mcs"
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --enable-introspection --enable-gtk-doc=no --disable-tests --disable-mono-test --with-gtk=3
    make
}

package()
{
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

