# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Librewish <librewish@gmail.com?

pkgbase=greetd-qtgreet
pkgname=('greetd-qtgreet' 'greetd-qtgreet-qt6')
_pkgname=QtGreet
pkgver=2.0.1
pkgrel=1
pkgdesc='Qt based greeter for greetd'
arch=('aarch64' 'x86_64')
url="https://gitlab.com/marcusbritanicus/$_pkgname"
license=('GPL3')
makedepends=('meson' 'ninja' 'qt5-base' 'dfl-wayqt' 'dfl-login1' 'dfl-applications' 'dfl-utils' 'qt6-base' 'dfl-wayqt-qt6' 'dfl-login1-qt6' 'dfl-applications-qt6' 'dfl-utils-qt6' 'mpv' 'wlroots')
source=("$pkgbase-$pkgver.tar.gz::$url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('29071a5398f1c97af82eab60496fcee71c2b2c3f2c25a33b82083f1640869cf1')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT5 version..."
  meson .build --prefix=/usr -Duse_qt_version=qt5 --buildtype=release
  ninja -C .build

  echo "Building QT6 version..."
  meson .build-qt6 --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build-qt6
}

package_greetd-qtgreet() {
  depends=('qt5-base' 'dfl-wayqt' 'dfl-login1' 'dfl-applications' 'dfl-utils' 'mpv' 'wlroots')
  optdepends=('wayfire')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

package_greetd-qtgreet-qt6() {
  depends=('qt6-base' 'dfl-wayqt-qt6' 'dfl-login1-qt6' 'dfl-applications-qt6' 'dfl-utils-qt6' 'mpv' 'wlroots')
  optdepends=('wayfire')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build-qt6 install
}
