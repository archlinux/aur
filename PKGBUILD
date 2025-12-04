# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=python-tt-tools-common
pkgver=1.4.33
pkgrel=1
pkgdesc="Common utilities shared across Tentorrent tools."
arch=('any')
url='https://github.com/tenstorrent/tt-tools-common'
license=('Apache')
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-scm)
depends=(python-distro python-elasticsearch python-psutil python-pyyaml python-rich python-textual python-requests python-tqdm python-pydantic python-luwen)
provides=('python-tt-tools-common=1.4.32')
conflicts=("python-tt-tools-common")
source=("tt-tools-common::git+https://github.com/tenstorrent/tt-tools-common.git#tag=v${pkgver}")
sha256sums=('f76a06b097af20892d68113928c8ca2feff86b5082cbbf26115cb92763837033')

build() {
    cd tt-tools-common
    python -m build --wheel --no-isolation
}

package() {
    cd tt-tools-common
    python -m installer --destdir="$pkgdir" dist/*.whl

    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
