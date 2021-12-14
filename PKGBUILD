# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
pkgname='pyload-ng'
pkgver=0.5.0b2.dev9
pkgrel=1
pkgdesc="The free and open-source Download Manager written in pure Python"
url="https://pyload.net/"
license=('AGPL3')
arch=('any')
makedepends=('python-setuptools')
depends=('python-semver' 'python-pycurl' 'python-js2py' 'python-filetype' 'python-cryptography' 'python-bitmath'
	 'python-flask-themes2' 'python-flask-session' 'python-flask-compress' 'python-flask-caching' 'python-flask-babel'
	 'python-cheroot')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-$pkgver.tar.gz")
sha256sums=('d5696d660b666f0676d5fdcfbb0040346a46e1177539202b7ff8a39d3d247b2b')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  # fix library versions cryptography, flask-themes2, flask-babel and flask
  sed -e 's/~=3.0/>=3.0/g' -i setup.cfg
  sed -e 's/~=0.1/>=0.1/g' -i setup.cfg
  sed -e 's/l~=1.0/l>=1.0/g' -i setup.cfg
  sed -e 's/~=1.1/>=1.1/g' -i setup.cfg
}
build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py build
}

package() {

  cd "$srcdir/${pkgname}-${pkgver}/"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
