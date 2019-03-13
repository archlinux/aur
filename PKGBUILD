# Maintainer: Robert Tari <robert at tari dot in>
# Contributor: Valentin Huélamo <vhuelamo at gmail dot com>

pkgname="ayatana-indicator-messages"
pkgver="0.6.0"
pkgrel="3"
pkgdesc="Ayatana Indicator that collects messages that need a response"
arch=("i686" "x86_64")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("glib2" "accountsservice" "hicolor-icon-theme" "dconf")
makedepends=("gobject-introspection" "gtk-doc" "intltool" "accountsservice" "mate-common" "vala")
optdepends=("mate-ayatana-indicator-applet")
source=("http://releases.ayatana-indicators.org/source/${pkgname}/${pkgname}-${pkgver}.tar.gz" "0001.fix-testing-option.patch" "0002.fix-build.patch")
md5sums=("b8c38939ade3414741c2a4b0ddbb045a" "04a69f5f375f33564173083098a07855" "3fed27ba077bf991a0162c5b3b0d8698")
options=("!emptydirs")
provides=("indicator-messages")
conflicts=("indicator-messages")

prepare()
{
    cd ${pkgname}-${pkgver}
    patch -Np1 -i ../0001.fix-testing-option.patch
    patch -Np1 -i ../0002.fix-build.patch
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
