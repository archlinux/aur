# Maintainer: tblFlip <root@tblflip.de>

pkgname=python-vtf2img
pkgver=0.1.0
pkgrel=1
pkgdesc="A Python library to convert Valve Texture Format (VTF) files to images"

_name=${pkgname#python-}
# Since the repo does not have any tags
_commit_hash="6db0178d69b7b141279078cb3576d4d1f79ad567"

arch=(any)
url="https://github.com/julienc91/$_name"
license=("MIT")

makedepends=(
	python-build
	python-installer
	python-setuptools
	python-wheel
)

source=(
	"${pkgname}-$pkgver.tar.gz::$url/archive/$_commit_hash.tar.gz"
)

sha256sums=(
	"93d6b946032853b0055ff961d5c3784d8442e026a987578a3eeb33fa2e9cde10"
)

build() {
	cd $_name-$_commit_hash
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-$_commit_hash
	python -m installer --destdir="$pkgdir" dist/*.whl
}
