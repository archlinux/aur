# Current Maintainer: algebro <algebro at tuta dot io>
# Previous Maintainer: visad

_pkgname=frida
pkgname=python2-$_pkgname
pkgver=12.2.19
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 2 version from PyPi."
arch=('i686' 'x86_64')
url="http://www.frida.re"
license=('wxWindows Library License, Version 3.1')
depends=('python2' 'python2-pygments' 'python2-prompt_toolkit=1.0.15' 'python2-colorama')
source=("https://files.pythonhosted.org/packages/1b/fa/344500d06d3bf5b70c7252623440ae73cf064965b1d38c559af8521e868c/frida-${pkgver}.tar.gz"
        "COPYING")
sha256sums=('ba15e38367712756af11bdce28be60d8ed39747966f58dc3656dffd44befbe49'
            '5ea1544b51a28bc823b03159190d4108f9fb4f4ef912389f5137c6d295e175b2')
conflicts=("python-${_pkgname}")

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
