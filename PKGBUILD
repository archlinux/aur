pkgname=python-flask-git
_pkgname=flask
pkgver=0.10.1.r682.ge99fec2
pkgrel=1
pkgdesc='Micro webdevelopment framework for Python'
arch=('any')
url='http://flask.pocoo.org/'
license=('custom:BSD')
depends=('python-werkzeug' 'python-jinja' 'python-itsdangerous')
makedepends=('git')
conflicts=('python-flask')
provides=('python-flask')
source=('git://github.com/mitsuhiko/flask.git')
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
