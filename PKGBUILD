# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Ryan Coyner <rcoyner@gmail.com>

pkgbase=python-soappy
pkgname=python2-soappy
pkgver=0.12.22
pkgrel=2
pkgdesc="A module which implements a high-level interface to SOAP functions"
arch=('any')
url="http://pywebsvcs.sourceforge.net/"
license=('custom')
makedepends=("python2-setuptools")
conflicts=('python-soappy<=0.12.0-10')
replaces=('python-soappy<=0.12.0-10')
source=("https://pypi.python.org/packages/source/S/SOAPpy/SOAPpy-${pkgver}.zip"
        "$pkgbase-LICENSE::https://raw.githubusercontent.com/kiorky/SOAPpy/develop/LICENSE")
sha512sums=('d75d0bf8e88c8ecae57f51a201f9ab6f24fc41856ee2093e7e2e73e5d8618c9a766a69140df28a24b6d8493b53555c09502684c6d2fd78e90a3c53bba52f388b'
            '6b05765063f199eb609bca929457e348a6936ad8b65c7d0004772cfc29a75bc77a73a6f4c2d0c9bd9e97b28e78ac565dede5a395e775be4c27fd0f50990a127e')

build() {
  cd SOAPpy-${pkgver}
  python2 setup.py build
}

package_python2-soappy() {
  depends=('python2-wstools' 'python2-defusedxml')
  optdepends=('python2-m2crypto: for support for server-side SSL')

  cd SOAPpy-${pkgver}

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 ../$pkgbase-LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
