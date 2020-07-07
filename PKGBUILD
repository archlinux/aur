# Maintainer: Jonas Schöpf <jonas at schoepf dot me>
pkgname=csi-hg
pkgver=1.2.4.r2111.7fe648231f80
pkgrel=1
pkgdesc="An automatic confluence prover for term rewrite systems (TRSs) (mercurial version)"
arch=('i686' 'x86_64')
url="http://colo6-c703.uibk.ac.at/software/csi"
license=('LGPL')
conflicts=('mono')
provides=('csi')
depends=('libxslt' 'gmp')
makedepends=('ocaml' 'ocaml-findlib' 'ocaml-num' 'camlidl' 'mercurial')
source=($pkgname::hg+http://cl2-informatik.uibk.ac.at/mercurial.cgi/ttt2/)
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  printf "%s.r%s.%s" "$(hg tags | grep -m 1 'csi-' | sed 's/csi-\([^ ]*\).*/\1/')" "$(hg identify -n | sed 's/\([^+]*\)+/\1/')" "$(hg identify -i | sed 's/\([^+]*\)+/\1/')"
}

build() {
  msg "Starting make for: ${pkgname}"
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D csi $pkgdir/usr/bin/csi
}
