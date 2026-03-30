# Maintainer: X3r0Day

pkgname=specter
pkgver=0.1.0
pkgrel=1
pkgdesc="Subdomain enumeration and TCP port scanning toolkit"
arch=("any")
url="https://github.com/x3r0day/x3r0day-specter"
license=("MIT")
depends=("python" "python-rich")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
optdepends=(
  "nmap: aggressive service detection (-S) and sudo nmap mode (-U)"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7c9935ffa1d4585f9f29504b0ba312505e7eda3638932831e1875131f5952c6e')

build() {
  cd "$srcdir/x3r0day-specter-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/x3r0day-specter-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
