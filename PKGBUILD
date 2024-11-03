# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname='pyload-ng'
_pkgname=pyload_ng
pkgver=0.5.0b3.dev85
pkgrel=4
pkgdesc="The free and open-source Download Manager written in pure Python"
url="https://pyload.net/"
license=('AGPL3')
arch=('any')
depends=(python-dukpy python-werkzeug python-cryptography python-flask-session python-flask-themes2 python-pycurl python-semver python python-certifi python-jinja python-setuptools python-flask python-flask-caching python-filetype python-flask-babel python-flask-compress python-bitmath python-cheroot)
optdepends=('apprise'
            'caffeine-ng'
            'python-beautifulsoup4'
            'python-colorlog'
            'python-dbus'
            'python-importlib-metadata'
            'python-js2py'
            'python-magic'
            'python-passlib'
            'python-pillow'
            'python-pycryptodomex'
            'python-send2trash'
	    'python-slixmpp')
# https://github.com/izderadicka/adecaptcha, not packaged
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${_pkgname}-$pkgver.tar.gz")
sha256sums=('28ba5f879dc92aa7b49192dc4350b87d714561e3b9a4f8626bd7d1c56b1b2076')

prepare() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  # Allow higher library versions
  sed -e 's/~=/>=/g' -i setup.cfg
}

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}/"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}

