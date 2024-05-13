# Maintainer:   Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor:  Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.28.0
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=('ffmpeg' 'python-colorlog' 'python-ffmpeg-progress-yield' 'python-tqdm')
checkdepends=('python-pytest')
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('509e51dd0d3f7877f7f448b0fe1f51a1c1884fd19c6ebf0bf43dd3e0b433dc53867b3732bd1b2cc658c6d8c5a910840eea020922c3976bfa527924ff486560a7')

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
