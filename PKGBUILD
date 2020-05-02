# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

# PKGBUILD script for nato-spell upstream, git version
_pkgname=nato-spell
_pkgver=0.3.1
pkgname=$_pkgname-git
pkgver=0.3.1.r0.g575f3e3
pkgrel=1
pkgdesc="Spelling engine for the NATO phonetic alphabet"
arch=('i686' 'x86_64')
url="https://github.com/Qu4tro/nato-spell"
license=('MIT')
groups=()
depends=('alsa-utils' 'python')
makedepends=('git' 'sed' 'python-setuptools' 'python-poetry')
# optdepends=('***: for that thing *** does')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/$_pkgname.conf")
source=("$_pkgname::git+https://github.com/Qu4tro/nato-spell.git")
md5sums=('SKIP')


prepare() {
  cd "$_pkgname"
  poetry build
  cd dist
  tar -xf "$_pkgname-$_pkgver.tar.gz"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname/dist/$_pkgname-$_pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname/dist/$_pkgname-$_pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
