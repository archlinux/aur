# Maintainer:  lili1228 <lili (at) lili (dot) lgbt>
# Contributor: Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

_srcname=pulsectl-asyncio
pkgname=python-$_srcname
pkgver=1.2.1
pkgrel=1
pkgdesc='Asyncio frontend for pulsectl, a Python bindings library for PulseAudio (libpulse)'
arch=(any)
url="https://github.com/mhthies/$_srcname"
license=('MIT')
depends=('python>=3.6' 'python-pulsectl>=1:23.5.0')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_srcname}_$pkgver.tgz::https://github.com/mhthies/$_srcname/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b22d0a634433d558860ff1590020ba7272412be97da478a8b00ec457506cb58353b645537ae26591f1aed300cacc14fd0f50c8a3a0c7d650d610b24cc52248ee')

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
