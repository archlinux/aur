# Maintainer: Richard Garber <rg.1029384756@gmail.com>

pkgname=yaacs
pkgver=2.1.1
pkgrel=1
pkgdesc="Convert your Audiobooks to Opus in parallel"
url="https://github.com/rgarber11/YetAnotherAudiobookConverterScript"
arch=('any')
license=(GPL-2.0-only)
depends=('python>=3.9' 'ffmpeg' 'python-packaging' 'python-mutagen')

makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-lark-parser')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5772dd981b35e49573f9da7a782de2859d5b0335b0c40c66e1a118446888e0e6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
