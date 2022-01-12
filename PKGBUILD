# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: pumpkin <pumpkin at mailoo dot org>
# Contributor: Vsevolod Balashov <vsevolod at balashov dot name>
# Maintainer: edacval <edacval@gmail.com>
_base=gunicorn
pkgname=python2-${_base}
pkgver=19.9.0
pkgrel=3
pkgdesc='WSGI HTTP Server for UNIX'
arch=('any')
url="https://${_base}.org"
license=(MIT)
makedepends=(python2-setuptools)
source=(https://github.com/benoitc/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('8d1ff775dd5c1abb8bb4c80aecacb544382e38d101f105fd0fd7eb6bf98ecb663dd533d16e7b1741d6e5ef0eb12a707ab90e0a7751356e625725f076b4dc1a30')

build() {
  cd "${_base}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
  rm -r "$pkgdir"/usr/bin/${_base}_paster
  mv "$pkgdir"/usr/bin/${_base} "$pkgdir"/usr/bin/${_base}-python2
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
