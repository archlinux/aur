# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-richenum-git
pkgver=1.3.1.r124
pkgrel=1
pkgdesc='Powerful enum library for Python'
arch=('any')
url='https://github.com/hearsaycorp/richenum'
license=('Apache 2.0')
depends=('python>=3.7' 'python-six')
makedepends=('git' 'python-setuptools' 'python-pytest-runner')
provides=('python-richenum')
conflicts=("python-richenum" "${pkgname}")
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

