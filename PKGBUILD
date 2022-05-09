# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Javier Tia <javier dot tia at gmail dot com>

pkgname=python-pyvidia
_pkg="${pkgname#python-}"
pkgver=1.0.1
pkgrel=4
pkgdesc='NVIDIA driver version detector for Linux'
url='https://github.com/ntpeters/pyvidia'
arch=('any')
license=('MIT')
depends=('python-lxml' 'python-beautifulsoup4' 'python-six')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz"
        'LICENSE')
sha256sums=('b2b2f04c6f2b873e7c290a45db0b3e85e9ae3daac9b643d48966b23439c4fdea'
            '35e680322daa98915180af76a4bacd02c1dc65c6da057f7d26ada64c571113e4')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkg-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ft=sh ts=2 sw=2 et:
