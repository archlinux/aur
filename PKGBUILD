# Maintainer: giver <ryan01234keroro56789@gmail.com>

_pyname=angr
pkgname=python-${_pyname}
pkgver=9.2.32
pkgrel=1
pkgdesc='A powerful and user-friendly binary analysis platform'
url='https://github.com/angr/angr'
license=('BSD')
arch=('any')
depends=(
  'python'
  'python-ailment'
  'python-archinfo'
  'python-cachetools'
  'python-capstone'
  'python-cffi'
  'python-claripy'
  'python-cle'
  'python-dpkt'
  'python-itanium_demangler'
  'python-mulpyplexer'
  'python-nampa'
  'python-networkx'
  'python-progressbar'
  'python-protobuf'
  'python-psutil'
  'python-pycparser'
  'python-pyvex'
  'python-rpyc'
  'python-sortedcontainers'
  'python-sympy'
  'python-unicorn'
)
makedepends=(
  'gcc'
  'make'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ba943432f586f2185ed41416eedd9691405dbe74b00fabe3868e09e27817b996bdad365183a4be4517cd53c227504bb495cd521d20d7a6e8e9df9a076cc82d91')
b2sums=('398e23b8a0d9adbb95699aaaa7d8c97409c9d16e3e7033c43342c023e12576ce4830b573b19ac2c99e3b79c64a3bb3e16a26c17337fce992689263673bfa6647')

prepare() {
  # we don't support version pinning
  sed -e 's/==/>=/' -i $_pyname-$pkgver/setup.cfg
  sed -e 's/==/>=/g' -i $_pyname-$pkgver/pyproject.toml
}

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
