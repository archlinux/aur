# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgbase=pypy-camel-git
pkgname=(pypy-camel-git pypy3-camel-git)
pkgver=v0.1.r13.g13b7a26
pkgrel=1
pkgdesc='Python serialization module (build for pypy from git)'
arch=(any)
license=(ISC)
makedepends=('pypy3' 'pypy' 'pypy3-yaml' 'pypy-yaml')
url="https://github.com/eevee/camel"
source=(git+https://github.com/eevee/camel.git)
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/camel"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_pypy-camel-git () {
  depends=('pypy-yaml' 'pypy')
  conflicts=('pypy-camel')
  provides=('pypy-camel')

  cd "$srcdir/camel"
  pypy setup.py install --prefix=/opt/pypy --root="$pkgdir" --optimize=1
}

package_pypy3-camel-git () {
  depends=('pypy3-yaml' 'pypy3')
  conflicts=('pypy3-camel')
  provides=('pypy3-camel')

  cd "$srcdir/camel"
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
}
