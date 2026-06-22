# Maintainer: The SP <ammarsyamil057@gmail.com>
pkgname=anifetch-cli
pkgver=1.0.6
pkgrel=1
pkgdesc="Animated terminal fetch with video and audio support"
arch=('any')
url="https://github.com/Notenlish/anifetch"
license=('MIT')
depends=('python' 'chafa' 'ffmpeg' 'fastfetch' 'python-platformdirs' 'python-wcwidth' 'python-rich' 'python-pynput')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Notenlish/anifetch/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6d9ca7b426da7d9aefcc97eb7ccc9c38a13cf0bb65dcdc9c6f8ec6b74e8ab3f1')

build() {
  cd "$srcdir/anifetch-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/anifetch-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  if [ -f "$pkgdir/usr/bin/anifetch-cli" ]; then
    mv "$pkgdir/usr/bin/anifetch-cli" "$pkgdir/usr/bin/anifetch"
  fi
}