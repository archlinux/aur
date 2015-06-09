# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python2-werkzeug-git
_pkgname=werkzeug
pkgver=latest
pkgrel=1
pkgdesc='The Swiss Army knife of Python web development (git python2 version)'
arch=('i686' 'x86_64')
url='http://werkzeug.pocoo.org/'
license=('custom:BSD')
depends=('python2')
makedepends=('git')
conflicts=('python2-werkzeug')
provides=('python2-werkzeug')
source=('git+https://github.com/mitsuhiko/werkzeug.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

check() {
    cd "$srcdir/$_pkgname"
    python2 setup.py test || true
}

build() {
    cd "$srcdir/$_pkgname"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_pkgname"

    python2 setup.py install --root=${pkgdir} --optimize=1
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/python2-werkzeug
}
