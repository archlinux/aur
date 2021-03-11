# Maintainer:   Sian1468 <setthawut DOT a AT protonmail DOT com>

pkgname=ffmpeg-progress-yield
pkgver=0.0.4
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=(any)
url="https://github.com/slhck/ffmpeg-progress-yield"
license=(MIT)
depends=(ffmpeg python-tqdm python-colorama)
makedepends=(python-setuptools)
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('8e5bc0c4565586a35c8d584b2976701251387574ba95aa9077598b689dda81e68a17b0294e76511cc1536347b1aa8a29ae3fd79b32bb582c8b2c17712549d098')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}
check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python test/test.py
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
