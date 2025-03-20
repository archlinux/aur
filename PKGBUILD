# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.31.2
pkgrel=1
pkgdesc='Normalize loudness of audio and video files using FFmpeg'
arch=(any)
url=https://github.com/slhck/ffmpeg-normalize
license=(MIT)
depends=(ffmpeg python-colorlog python-ffmpeg-progress-yield python-tqdm)
checkdepends=(python-pytest)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('879b2acd5dfffb0de602618bac97a5493916f6c49e301072e9946b5b895bdecc0d60e025979e70509b59daa3d95f857e05d61ecfe3b4ef9878440c08d06cfe58')

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
