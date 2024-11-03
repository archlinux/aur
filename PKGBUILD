# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname='pyload-ng'
_pkgname=pyload_ng
pkgver=0.5.0b3.dev87
pkgrel=3
pkgdesc="The free and open-source Download Manager written in pure Python"
url="https://pyload.net/"
license=('AGPL3')
arch=('any')
depends=(
python
python-bitmath
python-certifi
python-cheroot
python-cryptography
python-dukpy
python-filetype
python-flask
python-flask-babel
python-flask-caching
python-flask-compress
python-flask-session
python-flask-themes2
python-jinja
python-pycurl
python-semver
python-setuptools
python-werkzeug

python-msgspec
# temp until python-flask-session dep is fixed
)
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
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${_pkgname}-$pkgver.tar.gz")
sha256sums=('2db8b16947ec59e53c595a59b122c998547f8552e10abd4346c21e15809cc450')

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

