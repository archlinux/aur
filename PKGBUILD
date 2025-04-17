# Contributor: Andreas Baumann <mail@andreasbauman.cc>
pkgname=corral-git
_pkgname=corral
pkgver=0.8.2.r9.g226c8c6
pkgrel=1
pkgdesc="Pony dependency manager tool"
arch=('x86_64')
url="https://github.com/ponylang/corral"
license=('BSD-2-Clause')
depends=()
makedepends=('ponyc' 'git')
provides=(corrall)
conflicts=(corral)
source=("${_pkgname}::git+https://github.com/ponylang/corral.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  VERSION=$(git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g' | tr '_' '.')
  echo $VERSION
}

build() {
  cd "$_pkgname"

  make prefix=/usr
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" prefix="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/corral/LICENSE"
}
