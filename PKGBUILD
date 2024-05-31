# Maintainer: Mort Yao <soi@mort.ninja>
# Maintainer: Johannes Wellhöfer <johannes.wellhofer@gmail.com>

pkgname=fstar-bin
pkgver=2023.09.03
_subver=
pkgrel=2
pkgdesc='A Higher-Order Effectful Language Designed for Program Verification'
url='https://fstar-lang.org/'
license=('Apache')
arch=('x86_64')
depends=()
provides=('fstar')
conflicts=('fstar' 'fstar-git')
source=("https://github.com/FStarLang/FStar/releases/download/v${pkgver}${_subver}/fstar_${pkgver}${_subver}_Linux_x86_64.tar.gz")
sha256sums=('dfc06973afecc48f1a7bd4e593215b438095dcf3451a45e33a6190f0c36a50ca')

package() {
  cd "fstar"

  install -d -m755 $pkgdir/opt/fstar $pkgdir/usr/bin
  cp -r * $pkgdir/opt/fstar

  # Instead of symlinking, create a wrapper script
  # ln -s /opt/fstar/bin/fstar.exe $pkgdir/usr/bin/fstar
  echo '#!/bin/sh' > $pkgdir/usr/bin/fstar
  echo 'exec /opt/fstar/bin/fstar.exe --smt /opt/fstar/bin/z3 "$@"' >> $pkgdir/usr/bin/fstar
  chmod +x $pkgdir/usr/bin/fstar
}
