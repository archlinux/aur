# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=bash-fuzzy-clock-git
_pkgname=bash-fuzzy-clock
pkgver=r19.265393d
pkgrel=1
pkgbase=bash-fuzzy-clock-git
pkgdesc="Script to display the time in natural language. Translated to six languages"
replaces=('bash-fuzzy-clock')
conflicts=('bash-fuzzy-clock')
arch=('any')
url="https://github.com/coreymwamba/bash-fuzzy-clock"
license=('OSL')
makedepends=('git')
depends=('bash')

source=('git+https://github.com/coreymwamba/bash-fuzzy-clock')
md5sums=('SKIP')
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "$srcdir/$_pkgname"
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
  cd "$srcdir/$_pkgname"
  install -p -D $_pkgname.sh -m 0755 $pkgdir/usr/bin/$_pkgname
  cp fr.mo $pkgdir/usr/share/locale/fr/LC_MESSAGES/bash-fuzzy-clock.mo
  cp es.mo $pkgdir/usr/share/locale/es/LC_MESSAGES/bash-fuzzy-clock.mo
  cp de.mo $pkgdir/usr/share/locale/de/LC_MESSAGES/bash-fuzzy-clock.mo
  cp it.po $pkgdir/usr/share/locale/it/LC_MESSAGES/bash-fuzzy-clock.mo
  cp pt.po $pkgdir/usr/share/locale/pt_BR/LC_MESSAGES/bash-fuzzy-clock.mo
  install -p -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -p -D -m 0644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README"
}
