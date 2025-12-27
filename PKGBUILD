# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=protonvpn-mod-next-gtk
pkgclonename=ProtonMOD-NEXT-LINUX
pkgver=4.13.4
pkgrel=1
pkgdesc="Community fork of proton-vpn-gtk-app. Features: hidden paid servers/countries for free users, unlocked some paid functions. Use at your own risk!"
arch=(any)
url="https://github.com/SMH01-MOD-NEXT/ProtonMOD-NEXT-LINUX/"
license=(GPL-3.0-or-later)
depends=(
  dbus-python
  glib2
  pango
  gtk3
  libnotify
  python
  python-cairo
  python-distro
  python-gobject
  python-packaging
  proton-vpn-daemon
  python-proton-core
  python-proton-keyring-linux
  python-proton-vpn-api-core
  python-proton-vpn-local-agent
  python-proton-vpn-network-manager
  python-requests
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  libappindicator-gtk3
)
source=("git+https://github.com/SMH01-MOD-NEXT/ProtonMOD-NEXT-LINUX.git#tag=v${pkgver}")
sha256sums=('ff47719183a2335651cc210cde99fcf07b3ada565dc5a04c7c07d74f1be59eb5')

build() {
  cd "$pkgclonename"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgclonename"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -d -m755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

  cp ./rpmbuild/SOURCES/proton.vpn.app.gtk.desktop "${pkgdir}/usr/share/applications/protonvpn.desktop"
  cp ./rpmbuild/SOURCES/proton-vpn-logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
}
