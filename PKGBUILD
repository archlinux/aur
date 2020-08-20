# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-messages"
pkgver="0.8.0"
pkgrel="1"
pkgdesc="Ayatana Indicator that collects messages that need a response"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("glib2" "accountsservice" "hicolor-icon-theme" "dconf")
makedepends=("gobject-introspection" "gtk-doc" "intltool" "accountsservice" "mate-common" "vala")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("477bdef294633403d944bdb5b05b1527")
options=("!emptydirs")
provides=("indicator-messages")
conflicts=("indicator-messages")

prepare()
{
    cd ${pkgname}-${pkgver}
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr --libexecdir=/usr/lib --enable-gtk-doc --disable-tests --disable-static
    make
}

package()
{
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    find ${pkgdir}/usr/lib -name *.la -delete
}
