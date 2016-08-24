pkgname=('python-docker-py-git')
_srcname='docker-py'
pkgver='r1'
pkgrel='1'
pkgdesc='An API client for docker written in Python'
arch=('any')
url="https://github.com/docker/${_srcname}"
license=('Apache')

depends=(
    'python'
    'python-six'
    'python-requests'
    'python-websocket-client'
)
makedepends=('git' 'python-setuptools')
provides=('python-docker-py')
conflicts=('python-docker-py')

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
