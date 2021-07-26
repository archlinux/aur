# Maintainer: zhs <zhao4she4@tuta.io>

pkgname=python-wsgiprox-git
_pkgname=wsgiprox
pkgver=r55.004870a
pkgrel=1
pkgdesc="Webrecorder wsgiprox, a Python WSGI middleware for adding HTTP and HTTPS proxy support to a WSGI application"
arch=("any")
url="https://github.com/webrecorder/wsgiprox"
license=("Apache")
depends=('python')
makedepends=('git' 'python-setuptools')
optdepends=('python-gevent-websocket: allow proxying websockets')
source=("git+https://github.com/webrecorder/wsgiprox")
sha256sums=('SKIP')

pkgver() {
        cd "${srcdir}/${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}" --skip-build --optimize=1
    rm -Rf ${pkgdir}/usr/lib/*/site-packages/test/    
}
