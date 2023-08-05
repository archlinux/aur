# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=amdfan
pkgdesc="Python daemon for controlling the fans on amdgpu cards"
pkgver=0.1.26
pkgrel=1
arch=('any')
license=('GPL2')
depends=('python' 'python-yaml' 'python-numpy' 'python-rich' 'python-click')
makedepends=('python-setuptools' 'python-poetry' 'python-build' 'python-installer')
url="https://github.com/mcgillij/amdfan"
source=("https://github.com/mcgillij/amdfan/releases/download/$pkgver/amdfan-$pkgver.tar.gz")
md5sums=('2d8c8bba737e6cd0cdbe064365366b42')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  install -Dm644 src/amdfan/amdfan.service "$pkgdir/usr/lib/systemd/system/"
}
