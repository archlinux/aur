# Maintainer: Éric Gillet <e+aur@linuxw.info>
pkgname=python-knowit
pkgver=0.5.11
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
sha256sums=('02d48f22b85e1ac8cf7aed6463a7cd93d0aa53b7befcab720949e0bf051dfb9d')
sha512sums=('a06a44d1643936c7ad0f53c50a9d609939b9e6045f415be05c85cb7b4d088d9f986eaae9442353af27a23c763a15a7a0dffdc95335a2e8655377eff1652a6c08')
b2sums=('9d4cbfa85c0c6cd1bab6349791ce24eaf68114ceefe309cc221cb86c20b7cab20f97c145122576d0fae342ba5f8240231b19aa04fc1ffdb7d748b4cd37453e46')

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

