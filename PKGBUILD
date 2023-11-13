# Maintainer: Kimiblock Moe

pkgname=amulet-map-editor-git

pkgdesc="The new age Minecraft world editor and converter that supports every version since Java 1.12 and Bedrock 1.7"
url="https://www.amuletmc.com/"
license=(custom)

arch=(any)
pkgver=r1973.57892e8d
pkgrel=1
makedepends=(python-build python-installer python-wheel)

depends=(python python-numpy python-wxpython python-opengl python-amulet-nbt python-pymctranslate python-minecraft-model-reader python-amulet-core)

provides=(amulet-map-editor amulet-map-editor-git)
conflicts=(amulet-map-editor amulet-map-editor-git)

source=(
	amulet.desktop
	icon.png
	"git+https://github.com/Amulet-Team/Amulet-Map-Editor.git"
)

sha256sums=(
	"SKIP"
	"SKIP"
	"SKIP"
)

function pkgver() {
	cd "${srcdir}/Amulet-Map-Editor"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function build() {
	cd "${srcdir}/Amulet-Map-Editor"
	python -m build --wheel --no-isolation
}

function package() {
	install -Dm755 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/amulet.png"
	install -Dm644 "${srcdir}/amulet.desktop" "${pkgdir}/usr/share/applications/amulet.desktop"
	cd "${srcdir}/Amulet-Map-Editor"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
