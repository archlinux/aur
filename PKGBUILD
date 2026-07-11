# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.41.1
pkgrel=1
pkgdesc='Normalize loudness of audio and video files using FFmpeg'
arch=(any)
url=https://github.com/slhck/ffmpeg-normalize
license=(MIT)
depends=(ffmpeg python-colorlog python-ffmpeg-progress-yield python-mutagen python-tqdm)
checkdepends=(git python-pytest uv)
makedepends=(git python-installer python-uv-build uv)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('e8deb8cfd4af26141de6fb5f8c26f1190d817c17aea9825aafe055b53bc9db1ebe22970a1eb7288021d8524e8e7e570dabde59efb26e5a71bdd0873cc1634be5')

#prepare() {
#  rm -rf $pkgname-$pkgver/dist
#}

build() {
  cd $pkgname-$pkgver
  #python -m build --no-isolation --wheel
  uv --no-cache --no-managed-python --offline build --no-build-isolation --out-dir=dist --wheel .
}

#check() {
#  cd $pkgname-$pkgver
#  uv venv --no-managed-python --system-site-packages
#  uv --no-cache --no-managed-python --offline pip install --link-mode=copy --no-deps dist/*.whl
#  PATH=".venv/bin:$PATH" ./.venv/bin/python -m pytest tests
#}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
