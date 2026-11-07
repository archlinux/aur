# Maintainer: Eritque Arcus <eritque-arcus at eritque-arcus dot tech>
# Maintainer: Noor Christensen <archlinux_AT_technopragmatics_DOT_org>

_name="pyhidra"
pkgname="python-$_name"
pkgver=1.3.0
pkgrel=1
pkgdesc='Pyhidra is a Python library that provides direct access to the Ghidra API within a native CPython interpreter using jpype.'
arch=(any)
url="https://github.com/dod-cyber-crime-center/$_name"
license=(LicenseRef-DC3-Pyhidra-Open-Source-License)
depends=(python python-jpype1 'java-environment>=17')
makedepends=(python-setuptools python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('d8c59b635a0adc056b67700b640e386d4d56153d59f912dcae52bdfc46fc4f26')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
