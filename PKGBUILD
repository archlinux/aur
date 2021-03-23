# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-huggingface-hub-git
pkgver=0.0.7.r29
pkgrel=1
pkgdesc='Client library to download and publish models on the huggingface.co hub'
arch=('any')
url='https://github.com/huggingface/huggingface_hub'
license=('Apache 2.0')
depends=('python>=3.6' 'python-filelock' 'python-tqdm' 'python-requests' 'python-importlib-metadata' 'python-espnet')
makedepends=('git' 'python-setuptools')
provides=('python-huggingface-hub')
conflicts=("python-huggingface-hub" "${pkgname}")
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

