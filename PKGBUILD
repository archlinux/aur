# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-elevenlabs
_reponame=elevenlabs-python
pkgver=2.13.0
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
sha256sums=('d18d06c9a65b645fbd2585fd15ea151c75872593182c1966076edfa7346a126c')

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
