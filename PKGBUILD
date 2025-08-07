# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=python-elevenlabs
_reponame=elevenlabs-python
pkgver=2.9.1
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
sha256sums=('89b45e0d6c37e5411e2614dee14e1646960acac9fdd5df4f0fdfc1c90c833a45')

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
