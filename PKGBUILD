# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname='pyload-ng'
pkgver=0.5.0b3.dev29
pkgrel=1
pkgdesc="The free and open-source Download Manager written in pure Python"
url="https://pyload.net/"
license=('AGPL3')
arch=('any')
depends=('python-semver' 'python-pycurl' 'python-js2py' 'python-filetype' 'python-cryptography' 'python-bitmath'
         'python-flask-themes2' 'python-flask-session' 'python-flask-compress' 'python-flask-caching' 'python-flask-babel'
         'python-cheroot' 'python-setuptools')
optdepends=('caffeine: For AntiStandby plugin'
            'python-beautifulsoup4: for XFileSharing plugin'
            'python-slixmpp: for XMPP plugin'
            'python-pillow: for some CAPTCHA stuff'
            'python-beaker: for some accounts') # <-- honestly I have no idea for which accounts but I saw there were some imports that needed beaker modules in code.
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-$pkgver.tar.gz")
sha256sums=('e3e938d3b9f37c832b1617885ca208898ab321a6b210d959b1c4e3ca09135b1e')

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
