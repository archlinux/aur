# Maintainer: Éric Gillet <e+aur@linuxw.info>
pkgname=python-trakit
pkgver=0.2.3
pkgrel=1
pkgdesc="Guess additional information from titles in media tracks"
arch=('any')
url="https://github.com/ratoaq2/trakit"
license=('MIT')
groups=()
depends=(
	python-babelfish
	python-rebulk
	python-pyyaml
)
makedepends=(
	python-build
	python-installer
	python-wheel
	python-poetry-core
)
checkdepends=(
    flake8
    mypy
    python-types-pyyaml
)
optdepends=(
    'ffmpeg: Increase the number of supported formats and information (ffprobe)'
    'mediainfo: Increase the number of supported formats and information (default provider)'
    'mkvtoolnix-cli: Increase the number of supported formats and information (mkvmerge)'
    'python-enzyme: Increase the number of supported formats and information'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/ratoaq2/trakit/archive/refs/tags/${pkgver}.tar.gz"
)

prepare() {
	cd "trakit-$pkgver"
	# patch -p1 -i "$srcdir/pint-0244.patch"
}

build() {
	cd "trakit-$pkgver"
    python -m build --wheel --no-isolation
}

# Disabled for now.
# Package metadata issues
# check() {
# 	cd "trakit-$pkgver"
# 	bash scripts/test.sh
# }

package() {
	cd "trakit-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('4f677ae863542ca395ac608b4ee6661048f8f95939f9aa1aceda2c95209d6348')
sha512sums=('3b3e491bc59b04bc867ab61bf19db06808181698b833fe02d57607dd8276d4e86c48d06df1b3d0510225cbca381a0074d7456b98a2f9dcfb82800dc1585ca230')
b2sums=('5439c6c0df54ec0c9046169739fe3390780f0f7bbd4ff2fe6167db812c2890dd4d4ba00c4c7e80902bbc29f4583b717a734a693b3f97283fd002a434de75125a')
