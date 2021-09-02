# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-pytorch-wpe-git
pkgver=0.0.0.r18
pkgrel=1
pkgdesc='PyTorch Weighted Prediction Error'
arch=('any')
url='https://github.com/kamo-naoyuki/dnn_wpe'
license=('custom:NTT')
depends=('python>=3.7' 'python-pytorch-complex-git' 'python-numpy')
makedepends=('git' 'python-setuptools')
provides=('python-pytorch-wpe')
conflicts=("python-pytorch-wpe")
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

