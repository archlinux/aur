# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=adwaita-qt-git
pkgver=1.1.0.r5.ge53c795
pkgrel=1
pkgdesc='A style to bend Qt applications to look like they belong into GNOME Shell (Qt5).'
arch=('x86_64')
url="https://github.com/FedoraQt/adwaita-qt"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake' 'git' 'qt5-base')
optdepends=('qgnomeplatform: apply GNOME settings to Qt apps')
conflicts=('adwaita-qt-common' "${pkgname%-git}" 'adwaita-qt5')
provides=('adwaita-qt-common' "${pkgname%-git}" 'adwaita-qt5')
source=("${pkgname%-git}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  mkdir build
  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" ../README.md
}
# vim:set ts=2 sw=2 et:
