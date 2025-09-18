# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=python-tt-tools-common-git
pkgver=1.4.28.r0.gf27b17b
pkgrel=3
pkgdesc="Common utilities shared across Tentorrent tools."
arch=('any')
url='https://github.com/tenstorrent/tt-tools-common'
license=('Apache')
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-scm)
depends=(python-distro python-elasticsearch python-psutil python-pyyaml python-rich python-textual python-requests python-tqdm python-pydantic python-luwen)
provides=("python-tt-tools-common")
conflicts=("python-tt-tools-common")
source=("tt-tools-common::git+https://github.com/tenstorrent/tt-tools-common.git")
sha256sums=('SKIP')

pkgver() {
  cd tt-tools-common
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
    cd tt-tools-common
    python -m build --wheel --no-isolation
}

package() {
    cd tt-tools-common
    python -m installer --destdir="$pkgdir" dist/*.whl

    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
