_pkgname=frida
pkgname=python-$_pkgname
pkgver=10.6.32
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('i686' 'x86_64') # setup.py downloads pre-built binary components, so it doesn't work on ARM (yet).
url="https://www.frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python' 'python-pygments>=2.0.2' 'python-prompt_toolkit>=0.57' 'python-colorama>=0.2.7')
source=("https://pypi.python.org/packages/e6/a3/4a9318fa9f6276f179164ed2c63599314b731052a4b55732cd82ff2b97f1/frida-${pkgver}.tar.gz"
        "COPYING")
md5sums=('08436ef6a5b72dc5eebe007d48bb4a7d'
         'SKIP')
sha512sums=('ae189314c3b787ad39fcd82a5b3bbba46d7102139460b538bd815499b7b1ab8af7b72ebbf717b1318f881c355e18c6005d6e6927ec9d48b2a90344bea7041849'
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
