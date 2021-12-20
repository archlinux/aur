# Maintainer: Lorenzo Gaifas <brisvag@gmail.com>

_name='justpy'
pkgname="python-${_name}"
pkgver=0.2.2
pkgrel=1
pkgdesc="An object oriented high-level Python Web Framework that requires no frontend programming."
arch=('any')
license=('Apache')
url="https://justpy.io/"
makedepends=(
  'python-setuptools'
)
depends=(
  'python'
  'python-starlette'
  'uvicorn'
  'python-itsdangerous'
  'python-websockets'
  'python-jinja'
  'python-addict'
  'demjson'
  'python-httpx'
  'python-aiofiles'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('da81d2aaa2006bf5b853b961d31d32bf43fe73dc01b30f0fdafed42af883cafa')
provides=("python-${_name}")

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:<Paste>
