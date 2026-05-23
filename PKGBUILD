# Maintainer: Repeater <fakeroration@gmail.com>
pkgname=python-touying
_pkgname=${pkgname#python-}
pkgver=0.14.4
pkgrel=1
pkgdesc="A powerful package for creating presentation slides in Typst"
arch=('x86_64')
url="https://github.com/touying-typ/touying-exporter"
license=('MIT')
depends=('python' 'python-pptx>=0.6' 'python-pillow' 'python-jinja')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e27a7491190264fcc6f4b6eaa34feef7c0f605949ea52b54d001238456f158a8')

build() {
  cd "$srcdir/$_pkgname-exporter-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-exporter-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
