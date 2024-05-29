# Maintainer: Kimiblock Moe

pkgname=python-amulet-leveldb-git
pkgdesc="A Cython wrapper for Mojang's modified LevelDB library."
url="https://github.com/Amulet-Team/Amulet-LevelDB"
license=("LicenseRef-Amulet-Team-License")
arch=(any)
pkgver=1.0.2.r1.g47c490e8
pkgrel=1
makedepends=(python-setuptools git python-versioneer)
depends=(python python-portalocker python-leveldb cython gcc-libs glibc zlib)
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
	install -Dm644 "${srcdir}/Amulet-LevelDB/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
