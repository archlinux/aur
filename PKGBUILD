# Maintainer: Stefanos Mitropoulos stefmitropoulos@gmail.com
_pkgname="blueblack"
pkgname=blueblack
_name=blueblack
pkgver=1.0.6
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

sha256sums=('1ed0c7752d21b5f5429e90eec88edd47dd8dd9d2eab373d522482a3f31179049')

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
