# Maintainer: Kino <cybao292261@163.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-viztracer
_pkgname=viztracer
pkgver=0.16.2
pkgrel=2
pkgdesc='VizTracer is a low-overhead logging/debugging/profiling tool that can trace and visualize your python code execution.'
arch=('x86_64')
url="https://github.com/gaogaotiantian/viztracer"
license=('Apache-2.0')
depends=('python' 'python-objprint')
makedepends=(
  'python-wheel'
  'python-build'
  'python-installer'
)
optdepends=(
  'python-rich: Full function support'
  'python-orjson: Full function support'
  'chromium: browser to open html results'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/gaogaotiantian/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f22f89756779d6db03d343619432c9235d500c9fd52c33c4f92f121773f1aa18')

build() {
  cd "$srcdir/$_pkgname-$pkgver" || exit

  CFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[2-3]\s//g" <(echo $CFLAGS))
  CXXFLAGS=$(sed "s/-Wp,-D_FORTIFY_SOURCE=[2-3]\s//g" <(echo $CXXFLAGS))

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-$_pkgname/LICENSE"
}
