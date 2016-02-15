pkgname=('docker-compose-git')
srcname='compose'
pkgver='r1'
pkgrel='1'
pkgdesc='Define and run complex applications using Docker'
arch=('any')
url='https://github.com/docker/compose'
license=('Apache')

depends=(
    'python'
    'python-docopt'
    'python-yaml'
    'python-requests'
    'python-texttable'
    'python-websocket-client'
    'python-docker-py'
    'python-dockerpty'
    'python-six'
    'python-jsonschema'
    'python-setuptools'
)
makedepends=('git')
provides=('docker-compose')
conflicts=('docker-compose')

source=("${srcname}::git+https://github.com/docker/compose.git")
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

    install -D --mode=644 LICENSE "${pkgdir}/usr/share/licenses/${srcname}/LICENSE"
    install -D --mode=644 contrib/completion/bash/docker-compose "${pkgdir}/usr/share/bash-completion/completions/docker-compose"
}
