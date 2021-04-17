# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-espnet-model-zoo-git
pkgver=0.0.0a29.r170
pkgrel=1
pkgdesc='Manage pretrained models created by ESPnet toolkit'
arch=('any')
url='https://github.com/espnet/espnet_model_zoo'
license=('Apache 2.0')
depends=('python>=3.7' 'python-numpy' 'python-tqdm' 'python-requests' 'python-pandas' 'python-espnet')
makedepends=('git' 'python-setuptools')
provides=('python-espnet-model-zoo')
conflicts=("python-espnet-model-zoo" "${pkgname}")
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

