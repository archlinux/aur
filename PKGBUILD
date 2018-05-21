_pkgname=frida
pkgname=python-$_pkgname
pkgver=11.0.3
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('i686' 'x86_64') # setup.py downloads pre-built binary components, so it doesn't work on ARM (yet).
url="https://www.frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python' 'python-pygments>=2.0.2' 'python-prompt_toolkit>=0.57' 'python-colorama>=0.2.7')
source=("https://files.pythonhosted.org/packages/be/a5/878afec758e6790aa4f548d9dddcfb247d6355b9a72872e5d0b80dd9cfcb/frida-${pkgver}.tar.gz"
        "COPYING")
sha256sums=('26bf84fcb74eb6a1a07c4d712f69f6fa8e49ca6aa94c21f9fa19aee565ef590c'
            '5ea1544b51a28bc823b03159190d4108f9fb4f4ef912389f5137c6d295e175b2')
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
