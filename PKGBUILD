# Maintainer: libele <libele@disroot.org>

_pkgname=inform6lib
__pkgname=inform-stdlib
pkgname=inform-stdlib-git
pkgver=6.12.7.0.ga0d3e3d
pkgrel=1
pkgdesc="Inform 6 standard library (git version)"
arch=('any')
url="https://gitlab.com/DavidGriffith/inform6lib"
license=('Artistic2.0')
groups=('inform')
provides=('inform-stdlib')
conflicts=('inform-stdlib')
source=("git+https://gitlab.com/DavidGriffith/inform6lib.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

package() {
  install -vdm755 "$pkgdir/usr/share/$__pkgname"
  cp -r "$_pkgname/"*.h "$pkgdir/usr/share/$__pkgname"

  cd "$pkgdir/usr/share/$__pkgname"
  ln -s english.h "$pkgdir/usr/share/$__pkgname/English.h"
  ln -s grammar.h "$pkgdir/usr/share/$__pkgname/Grammar.h"
  ln -s parser.h "$pkgdir/usr/share/$__pkgname/Parser.h"
  ln -s verblib.h "$pkgdir/usr/share/$__pkgname/Verblib.h"
  ln -s verblib.h "$pkgdir/usr/share/$__pkgname/VerbLib.h"

  cd "$srcdir/$_pkgname"
  install -Dm644 caveats.txt "$pkgdir/usr/share/$__pkgname/caveats.txt"
  install -Dm644 voices_and_tenses.txt "$pkgdir/usr/share/$__pkgname/voices_and_tenses.txt"

  install -Dm644 ARTISTIC "$pkgdir/usr/share/licenses/$__pkgname/ARTISTIC"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$__pkgname/COPYING"

}
