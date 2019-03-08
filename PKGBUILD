# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-sound"
pkgver=git_r2634
pkgrel=2
pkgdesc="Ayatana system sound indicator"
arch=("i686" "x86_64")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("pulseaudio" "libayatana-indicator-gtk3" "glib2" "accountsservice" "dconf" "libnotify" "libgee")
makedepends=("cmake" "cmake-extras" "dbus" "accountsservice" "mate-common" "gsettings-desktop-schemas" "intltool" "vala" "glib2" "libpulse" "libnotify" "libgee" "libxml2" "pulseaudio" "qt5-base" "qt5-declarative" "systemd")
optdepends=("pavucontrol" "mate-media")
source=("git+https://github.com/AyatanaIndicators/${pkgname}.git")
md5sums=("SKIP")
options=("!emptydirs")

pkgver()
{
    cd ${srcdir}/${pkgname}
    echo "git_r$(git rev-list --count HEAD)"
}

prepare()
{
    cd ${srcdir}/${pkgname}
    patch -Np1 -i ../../0001.add-testing-option.patch
}

build()
{
    cd ${srcdir}/${pkgname}
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib -DCMAKE_INSTALL_LOCALSTATEDIR=/var -Denable_tests=OFF
    make
}

package()
{
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}
