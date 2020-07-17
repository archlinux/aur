# Maintainer: Guillaume Hayot <ghayot[at]postblue[dot]info>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="libayatana-indicator"
pkgver=0.6.3
pkgrel="1"
pkgdesc="Ayatana Indicators (Shared Library)"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/libayatana-indicator"
license=("LGPL2.1" "LGPL3")
makedepends=("gtk3" "glib2" "ayatana-ido" "mate-common")
depends=("gtk3" "glib2" "ayatana-ido")
options=('!emptydirs')
source=("https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver.tar.gz")
md5sums=("584fd2838ed6c62f1ca21f1d94d9ea1b")
replaces=("${pkgname}-gtk3")

prepare()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --with-gtk=3 --disable-tests
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
