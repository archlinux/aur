# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-elevenlabs
_reponame=elevenlabs-python
pkgver=2.77.0
pkgrel=1
pkgdesc="ElevenLabs API module - generate realistic, captivating speech in a wide range of languages"
url="https://github.com/elevenlabs/elevenlabs-python"
arch=(any)
license=('MIT')
depends=(
	'python'
	'python-httpx'
	'python-pydantic'
	'python-websockets'
)
makedepends=(
	'git'
	'python-poetry'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/elevenlabs/elevenlabs-python/archive/v${pkgver}.tar.gz")
sha256sums=('5e0e6a85d3bc93777c9848c3850a4d55ef38d145b8695b42f0adc86478be692a')

build() {
	ls -lah
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
