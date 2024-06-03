# Maintainer: Stefanos Mitropoulos stefmitropoulos@gmail.com
_pkgname="blueblack"
pkgname=blueblack
_name=blueblack
pkgver=1.0.3
pkgrel=1
pkgdesc="Automatically switch between light/dark mode"
arch=('any')
url="https://github.com/smitropoulos/blueblack"
license=('GPL')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

depends=(
  'python-yaml>=6.0.1'
  'python-requests>=2.31.0'
  'python-xdg-base-dirs'
  'python-jsonschema>=4.21.1'
)

makedepends=(python-build python-installer python-wheel)

source=("https://github.com/smitropoulos/blueblack/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('cb7a24201ab2a66e9c57f29a1f5e7979eb4c269923a4b4ce0b99f0f6a8b43e4a')

prepare() {
  cd "$_name-$pkgver" || exit 1
}

build() {
  cd "$_name-$pkgver" || exit 1
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver" || exit 1
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p ${pkgdir}/usr/lib/systemd/user || return 1
  install -m644 systemd/blueblack.service ${pkgdir}/usr/lib/systemd/user || return 1
}
