# Maintainer: Aine <https://etke.cc>

pkgname='export-matrix-messages-git'
_pkgname='export-matrix-messages'
_exename='emm'
pkgver=v0.9.6
pkgrel=1
pkgdesc="A CLI tool that joins the room and exports last N messages to the file you specified."
arch=('x86_64')
license=('AGPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url="https://gitlab.com/etke.cc/tools/emm.git"
options=('!emptydirs')
makedepends=('git' 'go' 'just')
source=("${pkgname}"::"git+${url}")
noextract=(${source[@]%%::*})
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  just build
}

check() {
  cd "$srcdir/$pkgname"
  just test
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 $srcdir/$pkgname/$_exename "$pkgdir"/usr/bin/$_exename
  install -Dm644 $srcdir/$pkgname/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
