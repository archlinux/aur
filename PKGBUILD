# Maintainer: jakob <grandchild@gmx.net>

pkgname=nvitop
pkgver=1.1.2
pkgrel=1
pkgdesc="Interactive NVIDIA-GPU process viewer and GPU process management"
arch=(any)
url="https://github.com/XuehaiPan/nvitop"
license=('GPL3')
depends=(
    python
    # There are several packages that provide the "pynvml" module:
    # python-pynvml and python-nvidia-ml-py
    # Recently (v0.10.0) the author of nvitop started to use private functions of
    # python-nvidia-ml-py that python-pynvml doesn't provide. This was partly fixed in
    # https://github.com/XuehaiPan/nvitop/issues/44 but still shows a warning.
    # The problem is that python-nvidia-ml-py pulls in CUDA, a 5GiB dependency.
    # Until this is resolved I'd rather go with the warning than waste that much disk
    # space, because nvitop seems to work just the same (for me) with python-pynvml.
    # Feedback welcome!
    python-pynvml
    python-psutil
    python-cachetools
    python-termcolor
    ncurses
)
makedepends=('python-setuptools')
source=("https://github.com/XuehaiPan/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1918dd366a6f0ada9e7ecf1a1700a288ab546a0cd40efb13a83d734beee99007')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
