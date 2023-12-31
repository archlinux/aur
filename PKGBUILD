# Maintainer: Kimiblock Moe

pkgname=python-amulet-core
pkgdesc="A Python library for reading and writing the Minecraft save formats. See Amulet for the actual editor."
url="https://github.com/Amulet-Team/Amulet-Core"
license=(unknown)
arch=(any)
pkgver=1.9.21
pkgrel=1
makedepends=(python-build python-installer python-wheel)
depends=(python python-amulet-nbt python-numpy python-pymctranslate python-versioneer python-portalocker python-leveldb python-amulet-leveldb)
source=(
	"amulet-core-${pkgver}"::"https://github.com/Amulet-Team/Amulet-Core/archive/refs/tags/${pkgver}.tar.gz"
)
md5sums=(
	"SKIP"
)

function prepare() {
	sed -i 's/versioneer-518/versioneer/g' "${srcdir}/Amulet-Core-${pkgver}/pyproject.toml"
}

function build() {
	cd "${srcdir}/Amulet-Core-${pkgver}"
	python -m build --wheel --no-isolation
}

function package() {
	cd "${srcdir}/Amulet-Core-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
