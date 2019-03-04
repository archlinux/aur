# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-power"
pkgver="2.0.93"
pkgrel="1"
pkgdesc="Ayatana Indicator showing power state"
arch=("i686" "x86_64")
url="https://github.com/AyatanaIndicators"
license=("GPL2" "GPL3")
depends=("libayatana-indicator-gtk3" "upower" "systemd" "libnotify" "dconf")
makedepends=("cmake" "cmake-extras" "libnotify" "glib2" "python")
source=("http://releases.ayatana-indicators.org/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=("65b1804b1021262a1c064f26d58f46a1")
options=("!emptydirs")

prepare()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    patch -Np1 -i ../../0000_remove-testing-and-coverage.patch
    patch -Np1 -i ../../0001_enum-in-gschemas-unique.patch
}

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
