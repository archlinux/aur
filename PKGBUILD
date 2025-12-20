# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=tt-smi
pkgver=3.1.0
pkgrel=1
pkgdesc="Tenstorrent console based hardware information program"
arch=('any')
url='https://github.com/tenstorrent/tt-smi'
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python-distro python-elasticsearch python-psutil python-pyyaml python-rich python-textual python-requests python-tqdm python-pydantic python-importlib_resources python-luwen python-linkify-it-py python-tt-tools-common python-tomli)
provides=('tt-smi=3.0.39')
conflicts=("tt-smi")
source=("tt-smi::git+https://github.com/tenstorrent/tt-smi.git#tag=v${pkgver}")
sha256sums=('ae3886c81273c0bf173662655e7d33fd0b06dbe8b5de73595f9bac317e07375c')

build() {
    cd tt-smi
    python -m build --wheel --no-isolation
}

package() {
    cd tt-smi
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
