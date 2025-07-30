# Maintainer: Éric Gillet <e+aur@linuxw.info>
pkgname=python-trakit
pkgver=0.2.5
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

sha256sums=('43108201f0a18a037d4a511ef10bfe24b712ae58cfe704df8bc9e757b7b9d619')
sha512sums=('152a1124201646fb1ff5186c4026237eab7dfbdaf66136fed9967eb3a28c939b0bdda8ff777dfd0571b2455675ed313fbf118d6d3cfc2675def6da1a72cfe9b0')
b2sums=('48f91051f2532b3b9c8a4b1cdb44ebe052bdb5270d9a2de3f4ff44329e6a38492074581153281dd932cb0299f57410a29f58371c0cb8933cd9f9870d92e88baa')
