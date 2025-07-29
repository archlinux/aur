# Maintainer: Éric Gillet <e+aur@linuxw.info>
pkgname=python-knowit
pkgver=0.5.10
pkgrel=1
pkgdesc="Know better your media files"
arch=('any')
url="https://github.com/ratoaq2/knowit"
license=('MIT')
groups=()
depends=(
	python-babelfish
	python-enzyme
	python-pint
	python-pymediainfo
	python-pyyaml
	python-trakit
)
makedepends=(
	python-build
	python-installer
	python-poetry-core
	python-wheel
)
checkdepends=(
    flake8
    mypy
)
optdepends=(
    'ffmpeg: Increase the number of supported formats and information (ffprobe)'
    'mediainfo: Increase the number of supported formats and information (default provider)'
    'mkvtoolnix-cli: Increase the number of supported formats and information (mkvmerge)'
    'python-enzyme: Increase the number of supported formats and information'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/ratoaq2/knowit/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('99f10f53f2c0dd9588d8790433ae4810335c1db21433cca047f789cfae9d5f8a')
sha512sums=('0dcb272f502feecdf006c16e372145bc90ca0aba963252944be468b7ef8ddf5586f4ae8e1260f36949a5f40bd37e89292faeb0d3c1cbd33d68f1387fba48c210')
b2sums=('4c41f74c10fe788f352da26ca41d7c169b2681b3f6717692ff8923b7f8756a1c56ecccc2f62633be4ee36d8289e4b362f928f9eb2e57c6ff6c4fc32e8ef16651')

build() {
	cd "knowit-$pkgver"
    python -m build --wheel --no-isolation
}

# Disabled for now.
# Package metadata issues (knowit/__init__.py), and typing issues
# check() {
# 	cd "knowit-$pkgver"
#   bash scripts/test.sh
# }

package() {
	cd "knowit-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

