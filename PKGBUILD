# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=python-elevenlabs
_reponame=elevenlabs-python
pkgver=2.8.1
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
sha256sums=('b133878ecbbbe48a987ca4057ef97fb3dd84c8530fbcbab81a09b305fd7d2d5d')

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
