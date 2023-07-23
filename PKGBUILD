# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-hyperpyyaml-git
pkgver=1.2.1.r40
pkgrel=1
pkgdesc='Extensions to YAML syntax for better python interaction.'
arch=('any')
url='https://github.com/speechbrain/HyperPyYAML'
license=('Apache 2.0')
depends=('python>=3.7' 'python-pyaml' 'python-ruamel-yaml')
makedepends=('git' 'python-setuptools')
provides=('python-hyperpyyaml')
conflicts=("python-hyperpyyaml")
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

