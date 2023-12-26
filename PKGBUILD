# Maintainer: giver <ryan01234keroro56789@gmail.com>

_pyname=angr
pkgname=python-${_pyname}
pkgver=9.2.81
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
sha512sums=('fb4d8beb41804d700a10d99583f72dc3443ac21686d0e3f7314f3aaa1b69f33fca88585865e27730102bf1ca7e2301d4bbce2e65a314ad6b9875c652b8638af3')
b2sums=('bdaf94faffde85c1fc16b3a145f72e58bbb406e2953c08601abd3b42cb5693ac6d47c17f85b5762d8bdbb3e0689d79600b592fbf7fb1ba373101ea196a5ed8d4')

prepare() {
  # we don't support version pinning
  sed -e 's/==/>=/' -i $_pyname-$pkgver/{setup.cfg,pyproject.toml}
  # we don't support post-release and developmental-release
  sed -e 's/\.\(post\|dev\)[0-9]*//' -i $_pyname-$pkgver/{setup.cfg,pyproject.toml}
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
