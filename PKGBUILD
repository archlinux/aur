# Maintainer: Éric Gillet <e+aur@linuxw.info>
pkgname=python-trakit
pkgver=0.2.4
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

sha256sums=('34a1a905f9b8b9ce06ea88b01b62596416df2d351e642c821c7cb0cf9ba7a1f4')
sha512sums=('30368a90a5f687fc23835d996300306fb77a99aee3d1339e37ca215489f77f365c0bcf2bee5bd037c851a6d4ed05254e21de224564a308d36339f93bc240ddc6')
b2sums=('1e5447ac2ea1ba4834ca9a3c423051402aa3cb68c27dba8fd6d3d4ef2e73722a8aa3acf3b38715540280abf13a7e8b9d9758b450e41d6696d2816ca341e1cf77')
