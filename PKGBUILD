# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: jakob <grandchild@gmx.net>

pkgname=nvitop
pkgver=1.7.1
pkgrel=2
pkgdesc="Interactive NVIDIA-GPU process viewer and GPU process management"
arch=(any)
url="https://github.com/XuehaiPan/nvitop"
license=('Apache-2.0' 'GPL-3.0-only')
depends=('python' 'python-nvidia-ml-py' 'python-psutil' 'python-typing_extensions' 'ncurses')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/n/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3803112a1d4a7e01989ae5bf5a5e42f0366bf791d68ad8e3b1859d7ed747140c')

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
