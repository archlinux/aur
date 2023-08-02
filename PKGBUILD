# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=certbot-dns-dreamhost
pkgver=1.0
pkgrel=1
_commithash=2bb146706e49ef7dffd7f664a59f0372a1653aec
pkgdesc='DreamHost DNS authenticator plugin for Certbot'
arch=('any')
url="https://github.com/goncalo-leal/${pkgname}"
license=('GPL3')
depends=('python' 'python-acme' 'python-requests' 'certbot')
makedepends=('git' 'python-setuptools'
             'python-build' 'python-installer' 'python-wheel')
source=("git+${url}.git#commit=${_commithash}")
b2sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    python setup.py --version 2> /dev/null
}

prepare() {
    cd "${srcdir}/${pkgname}"
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
