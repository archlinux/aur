_pkgname=frida
pkgname=python-$_pkgname
pkgver=9.1.23
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('i686' 'x86_64') # setup.py downloads pre-built binary components, so it doesn't work on ARM (yet).
url="http://www.frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python' 'python-pygments>=2.0.2' 'python-prompt_toolkit>=0.57' 'python-colorama>=0.2.7')
source=("https://pypi.python.org/packages/9d/bd/8557c9efb2fa750d2ca1b4b1b76cf89309c7619e8f8a723e4a92acabbdcc/frida-${pkgver}.tar.gz"
        "COPYING")
md5sums=('864cb6d36e9b9c7f42d3da67fd51e250'
         'SKIP')
sha512sums=('f1fc6b36647f5f9c15231390d603021b4afa8ec8094bf2df61d863a462081651e98e6367661aa1d1bee305affdf5bf1250f6a30a57b869deec238db044577f42'
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
