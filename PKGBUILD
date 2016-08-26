pkgname=('python-dockerpty-git')
_srcname='dockerpty'
pkgver='r1'
pkgrel='1'
pkgdesc='Pseudo-tty handler for docker Python client'
arch=('any')
url="https://github.com/d11wtq/${_srcname}"
license=('Apache')

depends=('python' 'python-six')
makedepends=('git' 'python-setuptools')
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

package() {
    cd "${srcdir}/${_srcname}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
