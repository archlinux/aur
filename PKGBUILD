# Contributor: Thomas Jost <schnouki@schnouki.net>
pkgname=syncmaildir
pkgver=1.2.5
pkgrel=1
pkgdesc="Synchronize a pair of mailboxes in Maildir format via ssh"
arch=(i686 x86_64)
url="http://syncmaildir.sourceforge.net/"
license=('GPL3')
depends=('lua51' 'xdelta')
makedepends=('txt2man' 'vala')
checkdepends=('moreutils') # "combine" tool
optdepends=(
  "gconf: for smd-applet"
  "libgee06: for smd-applet"
  "libnotify: for smd-applet"
)
options=(!emptydirs)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('53b72cda05c5b79f197ead6ae985542b')
sha256sums=('19ff0adea83781788a6ace212e8a615950a5a50deafdfd6967c7585cdd5c54f0')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -e 's/valac-0.16/valac-0.20/' -i Makefile
  make update-smd-config
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=usr DESTDIR="$pkgdir" install
}


# vim:set ts=2 sw=2 et:
