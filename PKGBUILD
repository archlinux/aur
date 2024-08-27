# Maintainer:
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

_pkgname="ddupes"
pkgname="$_pkgname"
pkgver=2.3
pkgrel=4
pkgdesc="Extends fdupes action to directories, includes ffdupes (fast fdupes)"
url="https://pietrobattiston.it/ddupes"
license=('GPL-3.0-only')
arch=('any')

depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://pietrobattiston.it/_media/$_pkgname:$_pkgsrc.$_pkgext")
sha256sums=('5afe03c441c975c5e7b479a456746bb79699cc7cccd929747edd245895ee4a67')

prepare() {
  cd "$_pkgsrc"
  2to3 -w ddupes
  2to3 -w ffdupes
}

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
