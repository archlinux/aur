# Maintainer: Richard Garber <rg.1029384756@gmail.com>

pkgname=yaacs
pkgver=2.1.0
pkgrel=1
pkgdesc="Convert your Audiobooks to Opus in parallel"
url="https://github.com/rgarber11/yaacs"
arch=('any')
license=(GPL-2.0-only)
depends=('python>=3.9' 'ffmpeg' 'python-packaging' 'python-mutagen')

makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-lark-parser')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('3aef4449bd97aa8ff52330b6c04d33ebbc580bd84d11d93633d00bc0787daaab')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
