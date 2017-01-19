_pkgname=frida
pkgname=python-$_pkgname
pkgver=9.0.8
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('i686' 'x86_64') # setup.py downloads pre-built binary components, so it doesn't work on ARM (yet).
url="http://www.frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python' 'python-pygments>=2.0.2' 'python-prompt_toolkit>=0.57' 'python-colorama>=0.2.7')
source=("https://pypi.python.org/packages/fc/db/3f128766f557b693dd53764c5ba7de417381c5448f5edd1a3a66f9896527/frida-${pkgver}.tar.gz"
        "COPYING")
md5sums=('1561052b9b4e723adc7fc2d95ece81ee'
         'SKIP')
sha512sums=('3cafdcf1e421cf87fb2d3a5b2b79568d42316895f4dce5d3a29139cf22b43149343987754781db737d4c8a24b688673e850a7f241a8443776a472c8cdee109dd'
            'e36c8d5a0538fa4bb3575a60322057f7a687aab04c13deed25399462ba0be74ce6071cc41d967e23b9a96e552462d210280427a945c6cc956919b062878efc9a')
conflicts=("python2-${_pkgname}")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build

  cd "$srcdir"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/"
}
