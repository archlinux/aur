_pkgname=frida
pkgname=python-$_pkgname
pkgver=10.0.1
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('i686' 'x86_64') # setup.py downloads pre-built binary components, so it doesn't work on ARM (yet).
url="http://www.frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python' 'python-pygments>=2.0.2' 'python-prompt_toolkit>=0.57' 'python-colorama>=0.2.7')
source=("https://pypi.python.org/packages/fb/7a/644de0d4f4fde360620849fa257f3201ccaf23fa32d57407c3c1d5752614/frida-${pkgver}.tar.gz"
        "COPYING")
md5sums=('9af3c9e2c60b92cca86cac86927318b6'
         'SKIP')
sha512sums=('9486ce822d232c54689a2385a86e9ca9aa91cbe651e6c6e8975059e31af9e8d0537e30daee6e3b8ab62fd30d744be7e5e19e3773642659fddbd06a4456f12a94'
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
