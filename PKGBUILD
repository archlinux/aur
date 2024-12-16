# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.31.0
pkgrel=1
pkgdesc='Normalize loudness of audio and video files using FFmpeg'
arch=(any)
url=https://github.com/slhck/ffmpeg-normalize
license=(MIT)
depends=(ffmpeg python-colorlog python-ffmpeg-progress-yield python-tqdm)
checkdepends=(python-pytest)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('34afae70bbe322d409b4c2aa437ce96cf9560f0a24e36f6e2645bfcc648b542a7ddefc3d15d298b6d7f984f97ad339e49785b9159986a0b4b009c1b3025d0591')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}
check() {
  cd "$pkgname-$pkgver"
  pytest test/test.py
}
package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
