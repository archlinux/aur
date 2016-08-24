pkgname=('python-websocket-client-git')
_srcname='websocket-client'
pkgver='r1'
pkgrel='1'
pkgdesc='Websocket client for python'
arch=('any')
url="https://github.com/liris/${_srcname}"
license=('GPL2')

depends=('python-six')
makedepends=('git' 'python-setuptools')
provides=('python-websocket-client')
conflicts=('python-websocket-client')

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
