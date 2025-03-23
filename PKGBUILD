# Maintainer: Your Name <your.email@example.com>
pkgname=python-qtile-ebenezer
pkgver=0.1.27
pkgrel=1
provides=("$pkgname")
conflicts=("$pkgname")
pkgdesc="This repository provides a collection of widgets and behaviors spanning Desktop to Qtile Tiling Window Manager. (Git version)"
url="https://github.com/williampsena/qtile-ebenezer.git"
arch=('any')
license=('MIT')
depends=('python')
makedepends=(
  "git"
  "python-setuptools"
  "python-setuptools-scm"
  "python-wheel"
  "python-build"
  "python-installer"
  "python-ruamel-yaml"
)
source=(git+https://github.com/williampsena/qtile-ebenezer#tag=v$pkgver)
sha256sums=('SKIP')

build() {
  cd "$srcdir/qtile-ebenezer"
  rm -rf "$srcdir/qtile-ebenezer/dist"
  python -m build --wheel
}

package()
{
  cd "$srcdir/qtile-ebenezer"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 CHANGELOG -t "$pkgdir/usr/share/doc/$pkgname/"
}

