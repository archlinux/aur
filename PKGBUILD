# Maintainer:  lili1228 <lili (at) lili (dot) lgbt>
# Contributor: Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

_srcname=pulsectl-asyncio
pkgname=python-$_srcname
pkgver=1.2.0
pkgrel=1
pkgdesc='Asyncio frontend for pulsectl, a Python bindings library for PulseAudio (libpulse)'
arch=(any)
url="https://github.com/mhthies/$_srcname"
license=('MIT')
depends=('python>=3.6' 'python-pulsectl>=1:23.5.0')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_srcname}_$pkgver.tgz::https://github.com/mhthies/$_srcname/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b560c38b6d18a4c73551ae4ba34243f0043dc18426141c128c6ca3e8bd30f4d94d8718c3003ae506be038bc645ee569b77e6289b97ac913daa1e42e6b9aef03b')

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
