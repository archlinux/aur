# Maintainer: Robert Tari <robert at tari dot in>
# Contributor: Valentin Huélamo <vhuelamo at gmail dot com>

pkgname="ayatana-indicator-power"
pkgver="2.0.94"
pkgrel="1"
pkgdesc="Ayatana Indicator showing power state"
arch=("i686" "x86_64")
url="https://github.com/AyatanaIndicators"
license=("GPL2" "GPL3")
depends=("libayatana-indicator-gtk3" "upower" "systemd" "libnotify" "dconf")
makedepends=("cmake" "cmake-extras" "libnotify" "glib2" "python")
optdepends=("mate-ayatana-indicator-applet" "zenity" "powerd" "mate-control-center" "mate-power-manager")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz" "0002_add-testing-option.patch")
md5sums=("6b14508f80d39a535dde366358b748b7" "2fab358cf58bfde470e0b1f00931151b")
options=("!emptydirs")

prepare()
{
    cd ${pkgname}-${pkgver}
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
