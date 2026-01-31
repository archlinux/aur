pkgname=sorta
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI tool to automatically sort PDFs into folders using keyword routing"
arch=("any")
url="https://github.com/woterr/sorta"
license=("MIT")

depends=(
  "python"
  "python-typer"
  "python-rich"
  "python-watchdog"
  "python-pypdf"
)

makedepends=(
  "python-build"
  "python-installer"
  "python-wheel"
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("c622a4732d6f52660560c62041bdf54ee374342f2b3786de503c0bbba095bbb6")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
