# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-elevenlabs
_reponame=elevenlabs-python
pkgver=2.26.1
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
sha256sums=('f518344fc6facb22a94868a37697545a676b56a032b168de8cd13e420ebf88b5')

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
