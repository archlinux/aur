# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-torch-complex-git
pkgver=0.2.0.r94
pkgrel=1
pkgdesc='Python class for PyTorch-ComplexTensor (workaround for missing Pytorch Class)'
arch=('any')
url='https://github.com/kamo-naoyuki/pytorch_complex'
license=('unknown')
depends=('python>=3.7' 'python-pytorch')
makedepends=('git' 'python-pytorch' 'python-pytest')
provides=('python-torch-complex')
conflicts=("python-torch-complex" "${pkgname}")
source=(
    "${pkgname}::git+${url}")
md5sums=(
    'SKIP')


pkgver() {
    cd "${pkgname}"
    printf "%s.r%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)"
}


build() {
    cd "${pkgname}"
    python setup.py build
}


package() {
    cd "${pkgname}"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

