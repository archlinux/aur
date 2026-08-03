# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: envolution

pkgname=python-funk
pkgdesc='A mocking framework for Python, influenced by JMock'
_commit=c9415c25c2f70310550d7db65f3f563481d0cdc5
pkgver=0.5.0.r12.g${_commit:0:7}
pkgrel=1
url='https://github.com/mwilliamson/funk'
arch=(any)
license=('BSD-2-Clause')
checkdepends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools')
depends=('python' 'python-precisely')
source=("${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('5ac9925b53eb6f0701359f1c057eff7bd0dbd5f668062bed7545028734414568a2471793a87a5214a25f8c6373d3b6a01af6bb5c2553d0fa2689c3b8ff744176')

prepare() {
  cd "funk-${_commit}"

  # disable bdist_wheel.universal: deprecated and not required
  rm -v setup.cfg
}

build() {
  cd "funk-${_commit}"

  python -m build --wheel --no-isolation
}

check() {
  cd "funk-${_commit}"

  python -m pytest test/
}

package() {
  cd "funk-${_commit}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" -m644 LICENSE
}
