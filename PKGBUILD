# Maintainer: jakob <grandchild@gmx.net>

pkgname=nvitop
pkgver=1.5.0
pkgrel=1
pkgdesc="Interactive NVIDIA-GPU process viewer and GPU process management"
arch=(any)
url="https://github.com/XuehaiPan/nvitop"
license=('Apache-2.0')
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
    ncurses
)
makedepends=('python-setuptools')
source=("https://github.com/XuehaiPan/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('981bea0ed3f395bc02d106e02e607aa9e1b9d2d4182c84871682eb118a16dfa3')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
