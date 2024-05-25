# Maintainer: Stefanos Mitropoulos stefmitropoulos@gmail.com
_pkgname="blueblack"
pkgname=blueblack
_name=blueblack
pkgver=1.0.2
pkgrel=1
pkgdesc="Automatically switch between light/dark mode"
arch=('any')
url="https://github.com/stefmitropoulos/blueblack"
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

sha256sums=('ca05899d58753429a1eb372f34ab34696b07943370dab9c28ca14e5b952a900e')

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
