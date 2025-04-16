pkgname=('python-texttable-git')
_srcname='texttable'
pkgver=r105.1696325441.b4c00a6
pkgrel=1
pkgdesc='Python module to create simple ASCII tables'
arch=('any')
url="https://github.com/foutaise/${_srcname}"
license=('GPL2')
depends=('python')
optdepends=('python-cjkwrap: for better CJK support')
makedepends=('git' 'python-cjkwrap' 'python-setuptools')
checkdepends=('python-pytest')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${_srcname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}
build() {
    cd "${srcdir}/${_srcname}"
  python setup.py build
}
check() {
    cd "${srcdir}/${_srcname}"
  pytest tests.py
}

package() {
    cd "${srcdir}/${_srcname}"

    python setup.py install --root="$pkgdir" --optimize=1
}
