# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=syncmaildir
pkgver=1.2.6.2
pkgrel=1
pkgdesc="Synchronize a pair of mailboxes in Maildir format via ssh"
arch=(i686 x86_64)
url="http://syncmaildir.sourceforge.net/"
license=('GPL3')
depends=('lua51' 'xdelta')
makedepends=('txt2man' 'vala' 'libgee' 'libnotify' 'gconf' 'gtk3')
checkdepends=('moreutils') # "combine" tool
optdepends=(
  "gconf: for smd-applet"
  "gtk3: for smd-applet"
  "libgee: for smd-applet"
  "libnotify: for smd-applet"
)
options=(!emptydirs)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('bbe5edd98083ea8f08fc07ab837a8fee')
sha256sums=('735f609deff6491389cc4287aac5e0aaed4414be44dbe7c19384076b957cc588')
install="syncmaildir.install"

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=usr update-smd-config
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=usr VALAC=valac
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=usr test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=usr DESTDIR="$pkgdir" install
}
