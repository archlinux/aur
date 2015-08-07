pkgname=python-werkzeug-git
_pkgname=werkzeug
pkgver=2722.2b752ef
pkgrel=1
pkgdesc='The Swiss Army knife of Python web development (git python3 version)'
arch=('any')
url='http://werkzeug.pocoo.org/'
license=('custom:BSD')
depends=('python')
makedepends=('git')
conflicts=('python-werkzeug')
provides=('python-werkzeug')
source=('git+https://github.com/mitsuhiko/werkzeug.git')
md5sums=('SKIP')

pkgver() {
    cd $_pkgname

    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

check() {
    cd $_pkgname

    python setup.py test || true
}

build() {
    cd $_pkgname

    python setup.py build
}

package() {
    cd $_pkgname

    python setup.py install --root="${pkgdir}" --optimize=1

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-werkzeug"
}
