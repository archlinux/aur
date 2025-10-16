# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname='pyload-ng'
_pkgname=pyload_ng
pkgver=0.5.0b3.dev93
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
python-filetype
python-flask
python-flask-babel
python-flask-caching
python-flask-compress
python-flask-session
python-flask-themes2
python-jinja
python-packaging
python-pycurl
python-pydantic
python-pyminiracer
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
            'python-magic'
            'python-pillow'
            'python-send2trash'
	    'python-slixmpp')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${_pkgname}-$pkgver.tar.gz")
sha256sums=('b93d0969f658a28d1404bf01d3ddcd249559ae43c2fdcbd797805b9cbcdb350e')

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

