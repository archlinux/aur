pkgname=('python-docker-py-git')
srcname='docker-py'
pkgver='r1'
pkgrel='1'
pkgdesc='An API client for docker written in Python'
arch=('any')
url='https://github.com/docker/docker-py'
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

source=("${srcname}::git+https://github.com/docker/docker-py.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

package() {
    cd "${srcdir}/${srcname}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
