# Maintainer: Pavle Portic <arch@theedgeofrage.com>
pkgname=python-nerdfonts
pkgver=1.0.1
pkgrel=1
pkgdesc="NerdFonts for Python"
arch=("any")
url="https://gitlab.com/ajeetdsouza/nerdfonts-python"
license=("GPL3")
depends=("python")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel" "subversion")
source=("$pkgname::git+$url.git")
sha256sums=("SKIP")

build() {
  cd "$pkgname"
  ./nerdfonts/generate.sh
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
