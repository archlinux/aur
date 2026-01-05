# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

# PKGBUILD script for nato-spell upstream, git version
_pkgname=nato-spell
pkgname=$_pkgname-git
pkgver=0.3.2.r0.g1d4e830
pkgrel=1
pkgdesc="Spelling engine for the NATO phonetic alphabet"
arch=('any')
url="https://github.com/Qu4tro/nato-spell"
license=('MIT')
depends=('alsa-utils' 'python')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/Qu4tro/nato-spell.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
