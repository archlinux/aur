# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.44.0
pkgrel=1
pkgdesc='Normalize loudness of audio and video files using FFmpeg'
arch=(any)
url=https://github.com/slhck/ffmpeg-normalize
license=(MIT)
depends=(ffmpeg python-colorlog python-ffmpeg-progress-yield python-mutagen python-tqdm)
checkdepends=(git python-pytest uv)
makedepends=(git python-installer python-uv-build uv)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('7845af4f522d7600984e8026ad89e76d2701a72b59ceb44515dddf96db3afb75349ac22c703cd60d8226247ef430eff575a8a1034eb5f875e57856804efb9e56')

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
#  # Patch: disable test failing with ffmpeg 9
#  #PATH=".venv/bin:$PATH" ./.venv/bin/python -m pytest tests
#  PATH=".venv/bin:$PATH" ./.venv/bin/python -m pytest tests \
#    --deselect 'tests/test_verification.py::test_ebu_effective_targets[options1--5-1.0]'
#}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
