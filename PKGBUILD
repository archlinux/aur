# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=python-tt-tools-common
pkgver=1.5.0
pkgrel=1
pkgdesc="Common utilities shared across Tentorrent tools."
arch=('any')
url='https://github.com/tenstorrent/tt-tools-common'
license=('Apache')
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-scm)
depends=(python-distro python-elasticsearch python-psutil python-pyyaml python-rich python-textual python-requests python-tqdm python-pydantic python-luwen)
provides=('python-tt-tools-common=1.4.33')
conflicts=("python-tt-tools-common")
source=("tt-tools-common::git+https://github.com/tenstorrent/tt-tools-common.git#tag=v${pkgver}")
sha256sums=('998e8132679988f04ab47f0a2734fc6cb6907f02f7b2a6bd460fd75076b66202')

build() {
    cd tt-tools-common
    python -m build --wheel --no-isolation
}

package() {
    cd tt-tools-common
    python -m installer --destdir="$pkgdir" dist/*.whl

    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
