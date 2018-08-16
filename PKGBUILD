# Maintainer: Christian Mauderer <oss@c-mauderer.de>
# Previous maintainer: Justin Dray <justin@dray.be>

pkgname='python-flask-cache'
pkgver=0.13.1
pkgrel=2
pkgdesc='Adds cache support to your Flask application'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Cache'
license=('BSD')
depends=('python-flask')
makedepends=('python-distribute')
source=("https://pypi.python.org/packages/source/F/Flask-Cache/Flask-Cache-${pkgver}.tar.gz")
md5sums=('ab82a9cd0844891ccdb54fbb93fd6c59')
conflicts=('python-flask-cache-git')

build() {

  cd "${srcdir}/Flask-Cache-${pkgver}"

  # Workaround for https://github.com/thadeusb/flask-cache/issues/188
  sed -e 's/flask.ext.cache/flask_cache/g' -i flask_cache/jinja2ext.py

  python ./setup.py build

}

package() {

  cd "${srcdir}/Flask-Cache-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
