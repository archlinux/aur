# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=acestream-launcher
pkgver=2.1.0
pkgrel=3
pkgdesc="Open AceStream links with a Media Player of your choice"
arch=("any")
url="https://github.com/jonian/acestream-launcher"
license=("GPL-3.0-only")
depends=("python" "python-acestream")
optdepends=(
  "acestream-engine"
  "libnotify: support for desktop notifications"
  "mpv: default media player"
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
provides=("${pkgname}")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ab3a9a8c88d95674c9159df02625b9dd4f8827cfe1b9322dfce9dfd19f3c725c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
