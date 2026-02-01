# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>

_pkgname=planex
pkgname=${_pkgname}-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Package installer utility for Plasma"
arch=(any)
url="https://github.com/MicrogamerCz/Planex"
license=(GPL-3.0-or-later)
depends=(
  pyside6
  python-gobject
  flatpak
  appstream
  libplasma
  layer-shell-qt
  knotifications
  kirigami
  qt6-declarative
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("git+https://github.com/MicrogamerCz/planex.git")
sha256sums=('SKIP')

build() {
  cd ${_pkgname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -d -m755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

  cp org.kde.planex.desktop "${pkgdir}/usr/share/applications/org.kde.planex.desktop"
  cp planex.notifyrc "${pkgdir}/usr/share/knotifications6/planex.notifyrc"
#   cp ./rpmbuild/SOURCES/icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/" # TODO
}
