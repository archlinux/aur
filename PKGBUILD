# Maintainer: Éric Gillet <e+aur@linuxw.info>
pkgname=python-trakit
pkgver=0.2.2
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
makedepends=(python-build python-installer python-wheel)
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
	"https://github.com/ratoaq2/trakit/archive/refs/tags/${pkgver}.tar.gz"
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

sha256sums=('2ac726a4eb70ed3869a02e6a7d10c8fe192ac735f0ae1fa7c45589fff0a8cd39')
sha512sums=('3fbd6c9fc2badfabc15c8b78dbeb677b11ac687b6fed847bcc0d835268a180a492bf530c14f5cce2ad8db19fae2e6af8e8ff59c85fb577ce94d8ba0943a00021')
b2sums=('6bd651cae7892d7af9c7f68d313d3046074d4e8a7cf17eb7c562d5d44235142ccce309298ed10d612faf1d9405dbac579d73f36db8517a27ccea3457ada23b2f')
