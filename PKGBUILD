# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: jakob <grandchild@gmx.net>

pkgname=nvitop
pkgver=1.5.0
pkgrel=1
pkgdesc="Interactive NVIDIA-GPU process viewer and GPU process management"
arch=(any)
url="https://github.com/XuehaiPan/nvitop"
license=('Apache-2.0' 'GPL-3.0-only')
depends=('python' 'python-pynvml' 'python-psutil' 'ncurses')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/n/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('981bea0ed3f395bc02d106e02e607aa9e1b9d2d4182c84871682eb118a16dfa3')

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
