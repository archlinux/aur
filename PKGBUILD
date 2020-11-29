# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-wandb-git
pkgver=0.10.12.dev1.r3660
pkgrel=1
pkgdesc='Pure Python module for reading and writing kaldi ark files'
arch=('any')
url='https://github.com/wandb/client'
license=('MIT')
depends=('python>=3.7' 'python-gitpython' 'python-dateutil' 'python-requests' 'python-click' 'python-promise' 'python-shortuuid' 'python-six' 'python-watchdog' 'python-psutil' 'python-sentry_sdk' 'python-subprocess32' 'python-protobuf' 'python-pyaml')
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

