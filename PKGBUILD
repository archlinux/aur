# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname='pyload-ng'
pkgver=0.4.20
pkgrel=1
pkgdesc="The free and open-source Download Manager written in pure Python"
url="https://github.com/pyload/pyload"
license=('AGPL3')
arch=('any')
depends=('python-semver' 'python-pycurl' 'python-js2py' 'python-filetype' 'python-cryptography' 'python-bitmath'
         'python-flask-themes2' 'python-flask-session' 'python-flask-compress' 'python-flask-caching' 'python-flask-babel'
         'python-cheroot' 'python-setuptools' 'python-certifi')
optdepends=('caffeine: For AntiStandby plugin'
            'python-beautifulsoup4: for XFileSharing plugin'
            'python-slixmpp: for XMPP plugin'
            'python-pillow: for some CAPTCHA stuff'
            'python-beaker: for some accounts') # <-- honestly I have no idea for which accounts but I saw there were some imports that needed beaker modules in code.
source=("$_tarname.tar.gz::$url/archive/v$pkgver.tar.gz")
prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  # Allow higher library versions
  sed -e 's/~=/>=/g' -i setup.cfg
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
sha256sums=('438f9a2fc8ecb13b75f55b00192a2192c96a0a08ec1ae842cea17c7c49aab500')
