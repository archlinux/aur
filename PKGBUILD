# Maintainer: Tyler Cook <tcc@sandpolis.com>
# Contributor: Sean Enck <enckse@gmail.com>
pkgname=python-flask-git
_pkgname=flask
pkgver=1.0.2.r81.g7d9dcfa2
pkgrel=1
pkgdesc='Micro webdevelopment framework for Python'
arch=('any')
url='http://flask.pocoo.org/'
license=('custom:BSD')
depends=('python-werkzeug' 'python-jinja' 'python-itsdangerous' 'python-click')
makedepends=('git')
conflicts=('python-flask')
provides=('python-flask')
source=('git://github.com/pallets/flask.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root=${pkgdir} --optimize=1
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/python-flask
}
