# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.32.3
pkgrel=1
pkgdesc='Normalize loudness of audio and video files using FFmpeg'
arch=(any)
url=https://github.com/slhck/ffmpeg-normalize
license=(MIT)
depends=(ffmpeg python-colorlog python-ffmpeg-progress-yield python-mutagen python-tqdm)
checkdepends=(python-pytest)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('5fc3f5612c004b36423aa732a90ef85fa7af491cbbe3ae4eb92d2d0525880b440782e6041534bbaf3b920c95856ff6c2df44ac807b9174b9eb01ae1a23903432')

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
