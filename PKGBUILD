# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xdg-traymenu
pkgver=0.01.41
pkgrel=1
pkgdesc="XDG compliant system tray and root menu generator"
arch=('any')
url="https://github.com/bbidulock/xdg-traymenu"
groups=('xde')
license=('GPL')
depends=('perl-xml-sax')
optdepends=('perl-gtk2-unique: for xdg-traymenu'
            'xde-theme: style menus and wm detection'
            'xdg-launch: startup notification for menu items')
makedepends=('git')
options=('!emptydirs')
source=("$pkgname::git+https://github.com/bbidulock/xdg-traymenu.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
	git describe --tags|sed 's,[-_],.,g;s,\.g.*$,,'
}

build() {
  cd $pkgname
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" INSTALLVENDORSCRIPT=/usr/bin install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
