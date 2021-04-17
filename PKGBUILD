# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-wandb-git
pkgver=0.10.27.dev1.r3922
pkgrel=1
pkgdesc='Weights and Biases - organize and analyze machine learning experiments'
arch=('any')
url='https://github.com/wandb/client'
license=('MIT')
depends=('python>=3.7' 'python-gitpython' 'python-dateutil' 'python-requests' 'python-click' 'python-promise' 'python-shortuuid' 'python-six' 'python-watchdog' 'python-psutil' 'python-sentry_sdk' 'python-protobuf' 'python-pyaml')
makedepends=('git' 'python-setuptools')
provides=('python-wandb')
conflicts=("python-wandb-git" "${pkgname}")
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

