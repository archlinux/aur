_pkgname=frida
pkgname=python-$_pkgname
pkgver=10.4.0
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('i686' 'x86_64') # setup.py downloads pre-built binary components, so it doesn't work on ARM (yet).
url="http://www.frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python' 'python-pygments>=2.0.2' 'python-prompt_toolkit>=0.57' 'python-colorama>=0.2.7')
source=("https://pypi.python.org/packages/bd/9c/286a783d1bb827008500e288b0fafbbe809ae1c0b66490f0919866ac064f/frida-${pkgver}.tar.gz"
        "COPYING")
md5sums=('7f3b12b0d67a4e99fb444c6a04da80f8'
         'SKIP')
sha512sums=('e4997e0588327c2c154f4504b4e51be61487df2ea0d82c83213e8f3a916963f3a7271b22e574bc2432691263449471fd374846003602631e975dd180e4cbfb68'
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
