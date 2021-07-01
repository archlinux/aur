# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-sentencepiece-git
pkgver=0.1.96.r695
pkgrel=1
pkgdesc='Sentencepiece text tokenizer (Python version)'
arch=('any')
url='https://github.com/google/sentencepiece'
license=('Apache 2.0')
depends=('python>=3.7' 'python-protobuf')
makedepends=('git' 'cmake' 'python-setuptools')
provides=('python-sentencepiece')
conflicts=("python-sentencepiece" "${pkgname}")
source=(
    "${pkgname}::git+${url}")
md5sums=(
    'SKIP')


pkgver() {
    cd "${pkgname}"
    printf "%s.r%s" "$(python python/setup.py --version)" "$(git rev-list --count HEAD)"
}


build() {
    cd "${pkgname}"/python
    python setup.py build
}


package() {
    cd "${pkgname}"/python
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

