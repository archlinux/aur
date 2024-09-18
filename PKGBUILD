# Maintainer: Thayne McCombs <astrothayne at gmail dot com>
pkgname=swaytools
pkgver=0.1.2
pkgrel=3
pkgdesc='Quality of life tools for sway'
arch=('any')
url="https://github.com/tmccombs/swaytools"
license=('GPL-3.0-only')
depends=('python' 'sway')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('slurp: for swayinfo' 'bemenu: for winfocus' 'dmenu: for winfocus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tmccombs/swaytools/archive/$pkgver.tar.gz")

b2sums=('c405936bb2080de1b9bd0800eb3cd4c6350a82d69860842e81f68a2ad0e8e425baa733a715bafc169c98a07b26b72bc9edea22fce613dbeb5ab8ad10669d9eed')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # use --no-isolation to use the existing installation of setuptools
  python -m build --no-isolation --wheel
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" --compile-bytecode=1 dist/*.whl
}
