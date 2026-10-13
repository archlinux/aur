# Maintainer:  Neurognostic <neurognostic+aur@astranetics.com>
# Contributor: lili1228 <lili (at) lili (dot) lgbt>
# Contributor: Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

_srcname=pulsectl-asyncio
pkgname=python-$_srcname
pkgver=1.3.2
pkgrel=1
pkgdesc='Asyncio frontend for pulsectl, a Python bindings library for PulseAudio (libpulse)'
arch=(any)
url="https://github.com/mhthies/$_srcname"
license=('MIT')
depends=(
	'python>=3.6'
	'python-pulsectl>=1:23.5.0'
	'python-pulsectl<=1:24.12.0'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
source=("${_srcname}_$pkgver.tgz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ffc553f855b7c9946f7a45f93d42db5b70adb1a64018b36352750cc942640129be030c97960ee9dc503127014bdeda4c56d4a5a55258a1b20391013efc5ebb57')

build() {
	cd "${srcdir}/${_srcname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_srcname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
