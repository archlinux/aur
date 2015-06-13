pkgname=('python-docker-py-git')
srcname='docker-py'
pkgver='r1'
pkgrel='1'
pkgdesc='An API client for docker written in Python'
arch=('any')
url='https://github.com/docker/docker-py'
license=('Apache')

depends=('python' 'python-six' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=('python-docker-py')
conflicts=('python-docker-py')

source=("${srcname}::git+https://github.com/docker/docker-py.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${srcname}"

    printf 'r%s.%s\n' \
        "$( git rev-list HEAD | wc --lines )" \
        "$( git describe --always | sed 's/-/./g' )"
}

package() {
    cd "${srcdir}/${srcname}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
