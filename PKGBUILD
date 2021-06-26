# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-viztracer
_name=viztracer
pkgver=0.13.4
pkgrel=1
pkgdesc='VizTracer is a low-overhead logging/debugging/profiling tool that can trace and visualize your python code execution.'
arch=('x86_64')
url='https://github.com/gaogaotiantian/viztracer'
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-rich: Full function support'
  'python-orjson: Full function support'
  'chromium: browser to open html results')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('944723e1e6a7f85249fd99c9d013b5d3899103ff80b191b2c926aba8c2769ba2d1c9bb9e0dbd82ea387e4351389d5f706fac4424be171dfc69ae9fa71fc243d3')

build() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  #  install -Dm644 $scrdir/README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
