# Maintainer: algebro <algebro at tuta dot io>

_pkgname=frida-tools
pkgname=python2-$_pkgname
pkgver=1.2.2
pkgrel=2
pkgdesc="CLI tools for Frida. Python 2 version from PyPi."
arch=('i686' 'x86_64')
url="http://www.frida.re"
license=('wxWindows Library License, Version 3.1')
depends=('python2' 'python2-pygments' 'python2-prompt_toolkit' 'python2-colorama' 'python2-frida')
source=("https://files.pythonhosted.org/packages/54/a4/6d0a320c21ba9964b6de1dfa197db7da5397904930c877c250804fcc2807/frida-tools-${pkgver}.tar.gz"
        "COPYING")
sha256sums=('d059760a06a4b01738685973502ea0655f1a49cc50305573c3264f06c1683942'
            '5ea1544b51a28bc823b03159190d4108f9fb4f4ef912389f5137c6d295e175b2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1 --skip-build
  cd "$srcdir"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/"
}
