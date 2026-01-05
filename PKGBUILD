# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

# PKGBUILD script for nato-spell upstream, git version
_pkgname=nato-spell
_pypkgname=nato_spell
_pkgver=0.3.1
pkgname=$_pkgname-git
pkgver=0.3.1.r1.ga5ecf81
pkgrel=1
pkgdesc="Spelling engine for the NATO phonetic alphabet"
arch=('i686' 'x86_64')
url="https://github.com/Qu4tro/nato-spell"
license=('MIT')
groups=()
depends=('alsa-utils' 'python')
makedepends=('git' 'sed' 'python-setuptools' 'python-poetry')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/Qu4tro/nato-spell.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  poetry build
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl
}
