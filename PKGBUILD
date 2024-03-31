# Maintainer: Kimiblock Moe

pkgname=python-amulet-leveldb-git
pkgdesc="A Cython wrapper for Mojang's modified LevelDB library."
url="https://github.com/Amulet-Team/Amulet-LevelDB"
license=(unknown)
arch=(any)
pkgver=1.0.0b5.r2.g11aa86c1
pkgrel=1
makedepends=(python-setuptools git)
depends=(python python-versioneer python-portalocker python-leveldb)
source=(
	"git+https://github.com/Amulet-Team/Amulet-LevelDB.git"
)
md5sums=(
	"SKIP"
)
provides=(python-amulet-leveldb)
conflicts=(python-amulet-leveldb)

function pkgver() {
	cd "${srcdir}/Amulet-LevelDB"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function prepare() {
	cd "${srcdir}/Amulet-LevelDB"
	git submodule init
	git submodule update
}

function build() {
	cd "${srcdir}/Amulet-LevelDB"
	python setup.py build
}

function package() {
	cd "${srcdir}/Amulet-LevelDB"
	python setup.py install --root="$pkgdir" --optimize=1
}
