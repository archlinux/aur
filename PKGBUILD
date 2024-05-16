# Maintainer:   Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor:  Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.28.1
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=('ffmpeg' 'python-colorlog' 'python-ffmpeg-progress-yield' 'python-tqdm')
checkdepends=('python-pytest')
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('32e77e7b7063cb829766a1ad19ea1aaf0288cea323ecbd6a01426e75b57e2d16ea5cb4e40075bdff9a065a51ae4592b3f73faadd91d7595cf9ab69fd711b8fd7')

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
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
