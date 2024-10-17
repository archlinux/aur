# Maintainer: giver <giverc139@gmail.com>

_pyname=angr
pkgname=python-${_pyname}
pkgver=9.2.123
pkgrel=1
pkgdesc='A powerful and user-friendly binary analysis platform'
url='https://github.com/angr/angr'
license=('BSD')
arch=('any')
depends=(
  'python'
  'python-cppheaderparser'
  'python-gitpython'
  'python-ailment'
  'python-archinfo'
  'python-cachetools'
  'python-capstone'
  'python-cffi'
  'python-claripy-git'
  'python-cle'
  'python-dpkt'
  'python-itanium_demangler'
  'python-mulpyplexer'
  'python-nampa'
  'python-networkx'
  'python-protobuf'
  'python-psutil'
  'python-pycparser'
  'python-pyformlang'
  'python-pyvex'
  'python-rich'
  'python-rpyc'
  'python-sortedcontainers'
  'python-sympy'
  'python-unicorn'
  'python-unique_log_filter'
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
sha512sums=('81c962462d73c2f0d5661c2f2da988a082512edd654a74e56545ffd7f7fb6aa5276f60b90db9cf1a34203a753d9dcefb5dd8b53abef79771e81061aa70ca0be5')
b2sums=('959633077fe04c225049dec5dbcf23e72f6298d93898e28c3ce05103f5ddfea6e6fc97e0daa0441a10994bbe7c7cbd75443fbfd416ba074abc7f12329ef81d5c')

prepare() {
  # we don't support version pinning
  sed -e 's/==/>=/g' -i $_pyname-$pkgver/{setup.cfg,pyproject.toml}
  # we don't support post-release and developmental-release
  sed -e 's/\.\(post\|dev\)[0-9]*//g' -i $_pyname-$pkgver/{setup.cfg,pyproject.toml}
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
