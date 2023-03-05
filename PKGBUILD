# Maintainer: Ferdinand Bachmann <ferdinand.bachmann@yrlf.at>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Victor Homic <aur (at) dothomic (dot) de>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Aniket Pradhan <aniket17133 (at) iiitd (dot) ac (dot) in>
# Contributor: Martin Briza <m (at) rtinbriza (dot) cz>

_base=adwaita-solarized-qt
pkgbase=adwaita-solarized-qt-git
pkgname=(adwaita-solarized-qt5 adwaita-solarized-qt6)
pkgver=1.4.1.r29.g3c98239
pkgrel=1
pkgdesc='A solarized style to bend Qt applications to look like they belong into GNOME Shell'
arch=(x86_64)
url='https://github.com/FedoraQt/adwaita-qt'
license=(GPL)
makedepends=(cmake qt5-x11extras qt6-base)
source=(git+https://github.com/Ferdi265/adwaita-solarized-qt)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_base"
    git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cmake -B build-qt5 -S $_base \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=OFF
  cmake --build build-qt5

  cmake -B build-qt6 -S $_base \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=ON
  cmake --build build-qt6
}

package_adwaita-solarized-qt5() {
  pkgdesc='A solarized style to bend Qt5 applications to look like they belong into GNOME Shell'
  depends=(qt5-x11extras)
  replaces=(adwaita-qt)
  conflicts=(adwaita-qt5)

  DESTDIR="$pkgdir" cmake --install build-qt5
}

package_adwaita-solarized-qt6() {
  pkgdesc='A solarized style to bend Qt6 applications to look like they belong into GNOME Shell'
  depends=(qt6-base)
  conflicts=(adwaita-qt6)

  DESTDIR="$pkgdir" cmake --install build-qt6
}

