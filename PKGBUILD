# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sebastian Wiesner <lunaryorn googlemail com>
# Contributor: Igor Ramos Tiburcio <irtigor@yahoo.com.br>
# Contributor: Wieland Hoffmann <themineo+aur@gmail.com>
# Contributor: Hervé Cauwelier <herve ¤ oursours.net>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>
pkgname=python2-py
_name=${pkgname#python2-}
pkgver=1.11.0
pkgrel=3
pkgdesc='I/O facilities including logging, local/SVN paths, INI parsing, '`
       `'API control, lazy importing and Python code generation/introspection'
arch=('any')
_pypi='https://pypi.python.org'
url="$_pypi/pypi/$_name"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("$_pypi/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Remove setuptools_scm dependency
  sed -i /scm/d setup.py
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
