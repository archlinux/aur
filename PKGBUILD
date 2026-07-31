# Maintainer: Éric Gillet <e+aur@linuxw.info>
pkgname=python-trakit
pkgver=0.3.0
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

sha256sums=('cf90c89cbd85335000821ae9b6ae5334323ba040048704cb2a9578e4b58df439')
sha512sums=('a603de06bb1020b6f9bd118dbe280c3b38246047ebde16bee060ad1098cb0fab4a01630f909db058ecc40a9daed941aacc2af3fd948bc6d74ff823ce2ef1d04f')
b2sums=('779f9a0758c84b995d74ae37ca9171cca6c88e8ddc49b925a93cb264b6385a202f388c40d8150fd634a1cd131a487645814d59a669de9b0711989e67fa1f96ba')
