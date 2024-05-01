# Maintainer: Martin Rys <rys.rs/contact>

pkgname=python-elevenlabs
_reponame=elevenlabs
pkgver=1.2.1
pkgrel=1
pkgdesc="ElevenLabs API module - generate realistic, captivating speech in a wide range of languages"
url="https://pypi.org/project/elevenlabs/"
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
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-${pkgver}.tar.gz")
sha256sums=('3f2fbcc7e4d8b6729bc0e278c691a08567ac0286d580c5da8db0928020bef23a')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
