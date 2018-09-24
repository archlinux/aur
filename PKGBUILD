# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>
# Submitter:  Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=bash-fuzzy-clock
pkgver=20181024
pkgrel=2
pkgdesc="Script to display the time in natural language. Translated to six languages"
arch=('any')
url="https://sourceforge.net/projects/bashfuzzyclock/"
license=('GPL')
depends=('bash')
provides=("bash-fuzzy-clock")
source=(https://downloads.sourceforge.net/project/bashfuzzyclock/$pkgname.tar.gz)
md5sums=('db39dac6248e34d7d00c1b525ee42e72')
build() {
  cd "$srcdir"
  msgfmt fr.po -o fr.mo
  msgfmt de.po -o de.mo
  msgfmt es.po -o es.mo
  msgfmt it.po -o it.po
  msgfmt pt.po -o pt.po
}

package() {
cd "$pkgdir"
  mkdir -p usr/bin/
  mkdir -p usr/share/locale/{fr,es,it,de,pt_BR}/LC_MESSAGES/
  cd $srcdir
  install -p -D $pkgname.sh -m 0755 $pkgdir/usr/bin/$pkgname
  cp fr.mo $pkgdir/usr/share/locale/fr/LC_MESSAGES/bash-fuzzy-clock.mo
  cp es.mo $pkgdir/usr/share/locale/es/LC_MESSAGES/bash-fuzzy-clock.mo
  cp de.mo $pkgdir/usr/share/locale/de/LC_MESSAGES/bash-fuzzy-clock.mo
  cp it.po $pkgdir/usr/share/locale/it/LC_MESSAGES/bash-fuzzy-clock.mo
  cp pt.po $pkgdir/usr/share/locale/pt_BR/LC_MESSAGES/bash-fuzzy-clock.mo
  install -p -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -p -D -m 0644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
