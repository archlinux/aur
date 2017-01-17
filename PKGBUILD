_pkgname=frida
pkgname=python-$_pkgname
pkgver=9.0.6
pkgrel=2
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('i686' 'x86_64') # setup.py downloads pre-built binary components, so it doesn't work on ARM (yet).
url="http://www.frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python' 'python-pygments>=2.0.2' 'python-prompt_toolkit>=0.57' 'python-colorama>=0.2.7')
source=("https://pypi.python.org/packages/89/eb/8daa1296eb79b16cc8aa2047eed22db4465a9067663fab536451c639b0ee/frida-${pkgver}.zip"
        "COPYING")
md5sums=('bae4dbe0a279f4423b7a95ce0203972b'
         'SKIP')
sha512sums=('8aa80f4aad21d9a9feec0db0ca676daba24701beab05d5e1087d950874a59471cd9c590b36c9cbdc72d040a44341f9daa5ba1e1bf6f1a07104c22d7d11f79eff'
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
