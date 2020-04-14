# Maintainer: algebro <algebro at tuta dot io>

_pkgname=frida-tools
pkgname=python-$_pkgname
pkgver=7.2.0
pkgrel=1
pkgdesc="CLI tools for Frida. Python 3 version from PyPi."
arch=('i686' 'x86_64')
url="http://www.frida.re"
license=('wxWindows Library License, Version 3.1')
depends=('python' 'python-pygments>=2.02' 'python-colorama>=0.2.7' 'python-frida>=12.8.12' 'python-prompt_toolkit>=3.0.3')
source=("https://files.pythonhosted.org/packages/source/f/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "COPYING")
sha256sums=('ffa8ba2c0f1c8e8a21367e6f65cb8eeef2c3a6cf49b115cf25c5d92a9947cb66'
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
