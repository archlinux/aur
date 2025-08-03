# Maintainer: kriskras99 <admin at kriskras99 dot nl>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: algebro <algebro at tuta dot io>

_pkgname=frida-tools
pkgname=python-frida-tools
pkgver=14.4.5
pkgrel=1
pkgdesc="CLI tools for Frida. Python 3 version from PyPi."
arch=('i686' 'x86_64')
url="http://www.frida.re"
license=('wxWindows Library License, Version 3.1')
# This actually requires websockets>=13, but that's not available in the repo yet
depends=('python' 'python-pygments>=2.15.1' 'python-colorama>=0.4.6' 'python-frida>=17.0.1' 'python-prompt_toolkit>=3.0.38' 'python-websockets>=13.0')
makedepends=(python-build python-installer python-wheel python-setuptools)
# Sourced from https://pypi.org/project/frida-tools/#files
source=("https://files.pythonhosted.org/packages/source/f/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "COPYING")
sha256sums=('b0877dd4a076a8b6ac247b1fad2e8d7ea72d9f49023d2ea278dc2d7e179a8bc3'
            '5ea1544b51a28bc823b03159190d4108f9fb4f4ef912389f5137c6d295e175b2')
conflicts=("python2-${_pkgname}")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  cd "$srcdir"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/"
}
