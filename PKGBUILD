# $Id: PKGBUILD 196971 2016-11-26 21:01:09Z bpiotrowski $
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-tlslite
pkgver=0.4.9
pkgrel=2
pkgdesc="SSL/TLS library in pure Python supporting RSA and SRP ciphersuites"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('python2-crypto: fast RSA operations and fast ciphers'
            'python2-gmpy: fast RSA and SRP operations'
            'python2-m2crypto: fast RSA operations and fast ciphers'
            'python2-tackpy: run an X.509 server using TACK')
url="http://trevp.net/tlslite"
license=('custom')
options=(!emptydirs)
source=(https://pypi.org/packages/source/t/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
sha256sums=('9b9a487694c239efea8cec4454a99a56ee1ae1a5f3af0858ccf8029e2ac2d42d')

prepare(){
  cd "${pkgname#python2-}-$pkgver"

  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "${pkgname#python2-}-$pkgver"

  python2 setup.py build
}

package() {
  cd "${pkgname#python2-}-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
