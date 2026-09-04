# Maintainer: CxOrg <clx.org@cloud-org.uk>
#
# Plasma 6 Quicklaunch applet - a customizable updated quicklaunch widget for KDE Plasma 6 panels.

pkgname=plasma6-applet-quicklaunch
pkgver=6.5.80
pkgrel=1
pkgdesc="Customizable quicklaunch widget for KDE Plasma 6 panels"
arch=(x86_64)
url="https://github.com/ixnewton/org.kde.plasma.quicklaunch"
license=(GPL-2.0-only GPL-3.0-only LicenseRef-KDE-Accepted-GPL)
depends=(qt6-base
         qt6-declarative
         kf6-config
         kf6-coreaddons
         kf6-ki18n
         kf6-kio
         kf6-service
         kf6-iconthemes
         kf6-jobwidgets
         plasma-activities)
makedepends=(extra-cmake-modules
             cmake
             git)
provides=(org.kde.plasma.quicklaunch)
conflicts=(org.kde.plasma.quicklaunch)
source=("git+https://github.com/ixnewton/org.kde.plasma.quicklaunch.git#branch=main")
sha256sums=('SKIP')

build() {
    cd "$srcdir/org.kde.plasma.quicklaunch"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF
    make -C build -j"$(nproc)"
}

package() {
    cd "$srcdir/org.kde.plasma.quicklaunch"
    make -C build DESTDIR="$pkgdir" install
}
