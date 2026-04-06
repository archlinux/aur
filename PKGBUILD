# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=python-openai-harmony-git
pkgver=0.0.8.r3.gf62abe6
pkgrel=1
pkgdesc="OpenAI Harmony response format library"
arch=('x86_64')
url="https://github.com/openai/harmony"
license=('Apache-2.0')
provides=(python-openai-harmony)
conflicts=(python-openai-harmony)
depends=('python' 'python-pydantic')
makedepends=('python-build' 'python-installer' 'python-wheel' 'rust' 'cargo' 'maturin' 'git' 'gcc' 'perl' 'nasm')
source=("git+https://github.com/openai/harmony.git")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$srcdir/harmony"
  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//')"
}

build() {
	cd $srcdir/harmony
	maturin build --release --interpreter python
}

package() {
	cd $srcdir/harmony
	python -m installer --destdir="$pkgdir" target/wheels/*.whl
}
