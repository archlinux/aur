_pkgname=frida
pkgname=python-$_pkgname
pkgver=9.1.27
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('i686' 'x86_64') # setup.py downloads pre-built binary components, so it doesn't work on ARM (yet).
url="http://www.frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python' 'python-pygments>=2.0.2' 'python-prompt_toolkit>=0.57' 'python-colorama>=0.2.7')
source=("https://pypi.python.org/packages/4a/69/04a6a2039f49b6c6f3af1a1274048aa7fc4b3b07d2d49fb77fc59691d698/frida-${pkgver}.tar.gz"
        "COPYING")
md5sums=('6c27ce2ed47f30ed468406c895f30d11'
         'SKIP')
sha512sums=('e300b759fd7d27c76dc85d25d0437666876ff1f3803417dca23eec9ff4a47b8e38fcd827a0115cbed9c6903bcd963ee11cce880ff4bfab5f447a18ef86238415'
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
