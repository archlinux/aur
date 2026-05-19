pkgname=nvitop-git
pkgver=1.7.0.r0.g3e797b2
pkgrel=1
pkgdesc="GPU process monitor for NVIDIA GPUs"
arch=('any')
url="https://github.com/XuehaiPan/nvitop"
license=('Apache')
depends=('python' 'python-psutil' 'python-nvidia-ml-py')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git')
provides=('nvitop')
conflicts=('nvitop')
source=("git+https://github.com/XuehaiPan/nvitop.git")
sha256sums=('SKIP')

pkgver() {
    cd nvitop
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd nvitop
    python -m build --wheel --no-isolation
}

package() {
    cd nvitop
    python -m installer --destdir="$pkgdir" dist/*.whl
}
