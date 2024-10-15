# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=tt-smi-git
pkgver=3.0.1
pkgrel=1
pkgdesc="Tenstorrent console based hardware information program"
arch=('any')
url='https://github.com/tenstorrent/tt-smi'
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python-distro python-elasticsearch python-psutil python-pyyaml python-rich python-textual python-requests python-tqdm python-pydantic python-importlib_resources python-luwen python-linkify-it-py python-tt-tools-common)
provides=("tt-smi")
source=("tt-smi::git+https://github.com/tenstorrent/tt-smi.git")
sha256sums=('SKIP')

pkgver() {
  cd tt-smi
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd tt-smi
    python -m build --wheel --no-isolation
}

package() {
    cd tt-smi
    python -m installer --destdir="$pkgdir" dist/*.whl
}
