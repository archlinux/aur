# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('i3ipc-python-git')
_srcname='i3ipc-python'
pkgver='r268'
pkgrel='1'
pkgdesc='An improved Python library to control i3wm'
arch=('any')
url="https://github.com/acrisci/${_srcname}"
license=('custom:BSD')

depends=('python' 'python-xlib')
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
