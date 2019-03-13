# Maintainer: Robert Tari <robert at tari dot in>
# Contributor: Valentin Huélamo <vhuelamo at gmail dot com>

pkgname="ayatana-indicator-power"
pkgver="2.0.93"
pkgrel="3"
pkgdesc="Ayatana Indicator showing power state"
arch=("i686" "x86_64")
url="https://github.com/AyatanaIndicators"
license=("GPL2" "GPL3")
depends=("libayatana-indicator-gtk3" "upower" "systemd" "libnotify" "dconf")
makedepends=("cmake" "cmake-extras" "libnotify" "glib2" "python")
optdepends=("mate-ayatana-indicator-applet" "zenity" "powerd" "mate-control-center" "mate-power-manager")
source=("http://releases.ayatana-indicators.org/source/${pkgname}/${pkgname}-${pkgver}.tar.gz" "0001_enum-in-gschemas-unique.patch" "0002_add-testing-option.patch")
md5sums=("65b1804b1021262a1c064f26d58f46a1" "aa58e7664e559967ba1b7e6c8ba1b4b1" "2fab358cf58bfde470e0b1f00931151b")
options=("!emptydirs")

prepare()
{
    cd ${pkgname}-${pkgver}
    patch -Np1 -i ../0001_enum-in-gschemas-unique.patch
    patch -Np1 -i ../0002_add-testing-option.patch
}

build()
{
    cd ${pkgname}-${pkgver}
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib -Denable_tests=OFF
    make
}

package()
{
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
