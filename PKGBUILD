# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname='pyload-ng'
_pkgname=pyload_ng
pkgver=0.5.0b3.dev88
pkgrel=1
pkgdesc="Free and Open Source download manager written in Python"
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
            'python-cgi'
            'python-colorlog'
            'python-dbus'
            'python-importlib-metadata'
            'python-js2py'
            'python-magic'
            'python-pillow'
            'python-pycryptodomex'
            'python-send2trash'
	    'python-slixmpp')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${_pkgname}-$pkgver.tar.gz")
sha256sums=('e985585e2631524a509831bf686120065272da850608d0e422c52dd1345c6aba')

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

