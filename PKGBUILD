# Maintainer: Jonas Schöpf <jonas at schoepf dot me>
pkgname=ttt2-hg
pkgver=1.20.1.r2116.7c846900def0
pkgrel=1
pkgdesc="An automatic termination prover for term rewrite systems (TRSs) (mercurial version)"
arch=('i686' 'x86_64')
url="http://colo6-c703.uibk.ac.at/ttt2"
license=('LGPL')
conflicts=('ttt2')
provides=('ttt2')
depends=('libxslt' 'gmp')
makedepends=('ocaml' 'ocaml-findlib' 'ocaml-num' 'camlidl' 'mercurial')
source=($pkgname::hg+http://cl2-informatik.uibk.ac.at/mercurial.cgi/ttt2/)
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  printf "%s.r%s.%s" "$(hg tags | grep -m 1 'ttt2-' | sed 's/ttt2-\([^ ]*\).*/\1/')" "$(hg identify -n | sed 's/\([^+]*\)+/\1/')" "$(hg identify -i | sed 's/\([^+]*\)+/\1/')"
}

build() {
  msg "Starting make for: ${pkgname}"
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D ttt2 $pkgdir/usr/bin/ttt2
}
