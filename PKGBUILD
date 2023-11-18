# Maintainer:
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

_pkgname="ddupes"
pkgname="$_pkgname"
pkgver=2.3
pkgrel=3
pkgdesc="Extends fdupes action to directories. Includes ffdupes (fast fdupes)."
arch=(any)
url="https://pietrobattiston.it/ddupes"
license=('GPL3')

depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"https://pietrobattiston.it/_media/$_pkgname:$_pkgsrc.$_pkgext"
)
sha1sums=(
  '2e5667da75a12e27634a6d4ca6133775bf1d7c0d'
)

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
  python -m installer --destdir="${pkgdir:?}" dist/*.whl
}

# vim:set ts=2 sw=2 et:
