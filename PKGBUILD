# Maintainer: Kimiblock Moe

pkgname=amulet-map-editor

pkgdesc="The new age Minecraft world editor and converter that supports every version since Java 1.12 and Bedrock 1.7"
url="https://www.amuletmc.com/"
license=(custom)

arch=(any)
pkgver=0.10.25
pkgrel=1
makedepends=(python-build python-installer python-wheel)

depends=(python python-numpy python-wxpython python-opengl python-amulet-nbt python-pymctranslate python-minecraft-model-reader python-amulet-core)

source=(
	amulet.desktop
	icon.png
	"amulet-${pkgver}"::"https://github.com/Amulet-Team/Amulet-Map-Editor/archive/refs/tags/${pkgver}.tar.gz"
)

sha256sums=(
	"SKIP"
	"SKIP"
	"SKIP"
)

build() {
	cd "${srcdir}/Amulet-Map-Editor-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	install -Dm755 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/amulet.png"
	install -Dm644 "${srcdir}/amulet.desktop" "${pkgdir}/usr/share/applications/amulet.desktop"
	cd "${srcdir}/Amulet-Map-Editor-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
