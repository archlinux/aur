# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=python-pysdl3
pkgver=0.9.1b2
pkgrel=1
pkgdesc="Python ctypes wrapper around SDL3"
arch=("any")
url="https://github.com/Aermoss/PySDL3"
license=("MIT")
depends=(
	"python-aiohttp"
	"python-packaging"
	"python-requests"
	"sdl3")
makedepends=(
	"python-build"
	"python-installer")
#optdepends=("sdl2_gfx" "sdl2_image" "sdl2_mixer" "sdl2_ttf")
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Aermoss/PySDL3/archive/refs/tags/v${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}::git+https://github.com/Aermoss/PySDL3.git#tag=v${pkgver}")
sha256sums=('92d66b78181c3fbd8c27eb465026ddcb3c4ba0c2f7cc8dde8f4cc04c5fb801d3')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build
	# Generate docs, not optional
	python -c "import sdl3"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
