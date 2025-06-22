# Maintainer: giver <giverc139@gmail.com>

_pyname=angr
pkgname=python-${_pyname}
pkgver=9.2.160
pkgrel=1
pkgdesc='A powerful and user-friendly binary analysis platform'
url='https://github.com/angr/angr'
license=('BSD')
arch=('any')
depends=(
  'python'
  'python-cxxheaderparser'
  'python-gitpython'
  'python-archinfo'
  'python-cachetools'
  'python-capstone'
  'python-cffi'
  'python-claripy'
  'python-cle'
  'python-mulpyplexer'
  'python-networkx'
  'python-protobuf'
  'python-psutil'
  'python-pycparser'
  'python-pydemumble'
  'python-pyformlang'
  'python-pypcode'
  'python-pyvex'
  'python-rich'
  'python-sortedcontainers'
  'python-sympy'
  'python-typing_extensions'
  'python-unicorn'
  'python-unique_log_filter'
)
makedepends=(
  'gcc'
  'make'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-rust'
  'python-wheel'
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ccaa5f0ad56fe528566895ad1f728ca6b9f9a4449c65c0e7dd8e5e5e7d8c168f3ce0ddf3bf605d51dab6d92c235dfac6e10588e89f9b73534b626827eb30ee7a')
b2sums=('99d45c95cdf90ec9ce1eed26e34f90c4ef87dfc70393f964b613a630dfbb1914e3032610f15df93cad13ccb07a5f6d52788a06e92de3a82a70aa23c7faf3fabb')

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
