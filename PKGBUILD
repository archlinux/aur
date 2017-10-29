_pkgname=frida
pkgname=python-$_pkgname
pkgver=10.6.18
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('i686' 'x86_64') # setup.py downloads pre-built binary components, so it doesn't work on ARM (yet).
url="https://www.frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python' 'python-pygments>=2.0.2' 'python-prompt_toolkit>=0.57' 'python-colorama>=0.2.7')
source=("https://pypi.python.org/packages/5b/0a/fb9b00a99b27ffc4c2c792fa94422be6f67b7a6323280d159ad9c322c1c1/frida-${pkgver}.tar.gz"
        "COPYING")
md5sums=('779a6317396b943db4a892a73b4594a8'
         'SKIP')
sha512sums=('428d269ac590f66dfa1497f50511d741e529393b2db2fa289e69dceb2ee16cd410b1a1a813b65242bb1b70734b8abbf25195192e76819658d32b57878b96a6cd'
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
