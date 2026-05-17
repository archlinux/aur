# Maintainer: The SP <ammarsyamil057@gmail.com>
pkgname=anifetch-cli
pkgver=1.0.4
pkgrel=1
pkgdesc="Animated terminal fetch with video and audio support"
arch=('any')
url="https://github.com/Notenlish/anifetch"
license=('MIT')
depends=('python' 'chafa' 'ffmpeg' 'fastfetch' 'python-platformdirs' 'python-wcwidth' 'python-rich' 'python-pynput')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Notenlish/anifetch/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a249350724ca66818a74e321477d772fc66d7adfc53b559a15f737b76d0a7572')

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