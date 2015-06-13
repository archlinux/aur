# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>
# Submitter:  Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=bash-fuzzy-clock
pkgver=20140201
pkgrel=4
pkgdesc="Script to display the time in natural language. English, French, German and Spanish"
arch=('any')
url="https://sourceforge.net/projects/bashfuzzyclock/"
license=('GPL')
depends=('bash')
makedepends=()
optdepends=()
provides=("bash-fuzzy-clock")
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=(https://downloads.sourceforge.net/project/bashfuzzyclock/$pkgname.tar.gz)
noextract=()
md5sums=('5ebd39555f2d6b887d7c3ac02b98c638')
build() {
  cd "$srcdir"
  msgfmt fr.po -o fr.mo
  msgfmt de.po -o de.mo
  msgfmt es.po -o es.mo
}

package() {
cd "$pkgdir"
  mkdir -p usr/bin/
  mkdir -p usr/share/locale/fr/LC_MESSAGES/
  mkdir -p usr/share/locale/de/LC_MESSAGES/
  mkdir -p usr/share/locale/es/LC_MESSAGES/
  cd $srcdir
  install -p -D $pkgname.sh -m 0755 $pkgdir/usr/bin/$pkgname
  cp fr.mo $pkgdir/usr/share/locale/fr/LC_MESSAGES/bash-fuzzy-clock.mo
  cp es.mo $pkgdir/usr/share/locale/es/LC_MESSAGES/bash-fuzzy-clock.mo
  cp de.mo $pkgdir/usr/share/locale/de/LC_MESSAGES/bash-fuzzy-clock.mo
  install -p -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -p -D -m 0644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
