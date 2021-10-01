# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-k2-git
pkgver=1.9
pkgrel=1
pkgdesc='FSA/FST algorithms, differentiable, with PyTorch compatibility'
arch=('any')
url='https://github.com/k2-fsa/k2'
license=('Apache 2.0')
depends=('python>=3.7' 'python-pytorch' 'python-graphviz' 'cuda')
optdepends=('hip: build with HIP')
makedepends=('git' 'python-setuptools' 'cmake' 'chrpath')
provides=('python-k2')
conflicts=("python-k2")
source=(
    "${pkgname}::git+${url}")
md5sums=(
    'SKIP')


pkgver() {
    cd "${pkgname}"
    # To obtain a version number compatible with PEP 440
    export K2_IS_STABLE=1
    printf "%s" "$(python setup.py --version)"
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


check(){
    cd "${pkgname}"
    # k2 requires the compiled binaries; therefore any check() would only work after package()
    # python -c "import k2; s = '0 1 10 0.1\n0 2 20 0.2\n\n  1 2 30 0.3\n  1 3 -1 0.4\n  2 3 -1 0.5\n  3\n'; fsa = k2.Fsa.from_str(s)"
}

