# Maintainer:  lili1228 <lili (at) lili (dot) lgbt>
# Contributor: Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

_srcname=pulsectl-asyncio
pkgname=python-$_srcname
pkgver=1.2.2
pkgrel=1
pkgdesc='Asyncio frontend for pulsectl, a Python bindings library for PulseAudio (libpulse)'
arch=(any)
url="https://github.com/mhthies/$_srcname"
license=('MIT')
depends=('python>=3.6' 'python-pulsectl>=1:23.5.0')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_srcname}_$pkgver.tgz::https://github.com/mhthies/$_srcname/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ccaa7ae14fd2ca7e9d6483efcb3d48f8364ed87ab99c700323c2f2d803986408394ae0fe83880d4d77b77daf17dfb58c6e9f94043a9b03ad643bff2e909a673a')

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
