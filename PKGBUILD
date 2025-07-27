# Maintainer: Éric Gillet <e+aur@linuxw.info>
pkgname=python-knowit
pkgver=0.5.8
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
sha256sums=('4e8b81e44b359648ea9b3b31c8859a5c83484c8f2dc2d9005a447fa36134dea5')
sha512sums=('e86b415538eb0ba4cb67c59661ba3866710fe1fa6d0f43022e718fc675882414dacb2d98bc0a9a08feea984d4427870bb13198edd613db99695ba9b3a4b9120b')
b2sums=('bed94cacc2af339640d86016c6d1e4c43316c6144a3bd0dfb7c80df44d191b838949a59d7baf5a15a05f973d40917e71f0694aa4756bb728e3a00fadbd9c0c51')

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

