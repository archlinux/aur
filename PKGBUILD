# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>

_pkgbase=python-proton-keyring-linux
pkgname="${_pkgbase}-no-gnome"
pkgver=0.2.3
pkgrel=2
pkgdesc="The proton-keyring-linux component without GNOME Keyring as a dependency."
arch=(any)
url="https://github.com/ProtonVPN/python-proton-keyring-linux"
license=(GPL-3.0-or-later)
depends=(
  python
  python-keyring
  python-proton-core
  org.freedesktop.secrets
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
provides=(python-proton-keyring-linux)
conflicts=(python-proton-keyring-linux)
source=("git+https://github.com/ProtonVPN/${_pkgbase}.git#tag=v${pkgver}")
sha256sums=('9d81b19c47e3da0363bfdf36e9e7312458538bcb4454dde3f6b5570f24052d93')

build() {
  cd "$_pkgbase"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgbase"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
