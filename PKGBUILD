# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-normalize-git
pkgver=2.0.3.r436
pkgrel=1
pkgdesc='Toolkit for wrapping network data in Python objects'
arch=('any')
url='https://github.com/hearsaycorp/normalize'
license=('Apache 2.0')
depends=('python>=3.7' 'python-six' 'python-future' 'python-richenum-git')
makedepends=('git' 'python-setuptools')
provides=('python-normalize')
conflicts=("python-normalize" "${pkgname}")
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

