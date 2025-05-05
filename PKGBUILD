# Maintainer: Éric Gillet <e+aur@linuxw.info>
pkgname=python-knowit
pkgver=0.5.6
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
makedepends=(python-build python-installer python-wheel)
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
	"https://github.com/ratoaq2/knowit/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('e42eabe7f4543cec6d9e8592b05103c48e81b2f371d4b1c0366f0f28c86cd98a')
sha512sums=('c064c2428300f0b2ee08e514e8deea2299f0aa9a552a7ac9ea914035e4e40666a21aa8d2256605d2c86c61592955f1e6b432d2cf43b7a34a3d1235d4b9971aaf')
b2sums=('da132883e7b4d15a2a21b22b05cb627859947f293a4611a853b2bd31341e4b317a5de42bb7ab48b64a340d96327cb579bb7722f1e875dfc58d1e26652844064c')

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

