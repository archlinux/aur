# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

# PKGBUILD script for nato-spell upstream, git version
_pkgname=nato-spell
pkgname=$_pkgname-git
pkgver=0.2.1
pkgrel=1
pkgdesc="Spelling engine for the NATO phonetic alphabet"
arch=('i686' 'x86_64')
url="https://github.com/Qu4tro/nato-spell"
license=('MIT')
groups=()
depends=('alsa-utils' 'python')
makedepends=('git' 'sed' 'python-setuptools' 'python-dephell')
# optdepends=('***: for that thing *** does')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/$_pkgname.conf")
source=("$_pkgname::git+https://github.com/Qu4tro/nato-spell.git")
md5sums=('SKIP')
pkgdir="/usr/lib"


prepare() {
  cd "$_pkgname"
  dephell deps convert --from pyproject.toml --to setup.py
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
