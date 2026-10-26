# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: jakob <grandchild@gmx.net>

pkgname=nvitop
pkgver=1.7.2
pkgrel=1
pkgdesc="Interactive NVIDIA-GPU process viewer and GPU process management"
arch=(any)
url="https://github.com/XuehaiPan/nvitop"
license=('Apache-2.0' 'GPL-3.0-only')
depends=('python' 'python-nvidia-ml-py' 'python-psutil' 'python-typing_extensions' 'ncurses')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/n/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('90b9d6dd3f61227acb2a8c9fdeb59f9a7c3cfa08196e0fe3bfd3877633cd4699')

latestver() {
    gh api repos/XuehaiPan/nvitop/releases/latest --jq '.tag_name' | sed 's/^v//'
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
