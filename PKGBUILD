# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.33.1
pkgrel=1
pkgdesc='Normalize loudness of audio and video files using FFmpeg'
arch=(any)
url=https://github.com/slhck/ffmpeg-normalize
license=(MIT)
depends=(ffmpeg python-colorlog python-ffmpeg-progress-yield python-mutagen python-tqdm)
checkdepends=(git python-pytest uv)
makedepends=(python-build python-installer python-uv-build)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('ee83d9ab48cf2a2e4e16e1fb1b9442e9a4b247fb4535de75c03ca823422d24d1a087598fb3a4ba6e4e91d8bf75e24b1904faece2eb243392b8c91383f329d652')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  uv run pytest tests
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
