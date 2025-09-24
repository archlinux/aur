# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=python-tt-tools-common
pkgver=1.4.29
pkgrel=1
pkgdesc="Common utilities shared across Tentorrent tools."
arch=('any')
url='https://github.com/tenstorrent/tt-tools-common'
license=('Apache')
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-scm)
depends=(python-distro python-elasticsearch python-psutil python-pyyaml python-rich python-textual python-requests python-tqdm python-pydantic python-luwen)
provides=("python-tt-tools-common")
conflicts=("python-tt-tools-common")
source=("tt-tools-common::git+https://github.com/tenstorrent/tt-tools-common.git#tag=v${pkgver}")
sha256sums=('eb8fe0daaa3c753ba98fd69c417d0fbbaa0ae0ad2fce6aa1026efa91e1e9ac7d')

build() {
    cd tt-tools-common
    python -m build --wheel --no-isolation
}

package() {
    cd tt-tools-common
    python -m installer --destdir="$pkgdir" dist/*.whl

    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
