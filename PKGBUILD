# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=syncmaildir
pkgver=1.3.0
pkgrel=1
pkgdesc="Synchronize a pair of mailboxes in Maildir format via ssh"
arch=(i686 x86_64)
url="https://github.com/gares/syncmaildir/"
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
source=(https://github.com/gares/syncmaildir/archive/version-${pkgver}.tar.gz)
md5sums=('04c908fa02fd7013c91c85c4991d0724')
sha256sums=('edc4a914310a337fde87b4e506b23c4b10ad0b7db6627e3a28741de2b530f2e3')

prepare() {
  cd "$srcdir/$pkgname-version-$pkgver"
  make PREFIX=usr update-smd-config
}

build() {
  cd "$srcdir/$pkgname-version-$pkgver"
  make PREFIX=usr VALAC=valac
}

check() {
  cd "$srcdir/$pkgname-version-$pkgver"
  make PREFIX=usr test
}

package() {
  cd "$srcdir/$pkgname-version-$pkgver"
  make PREFIX=usr DESTDIR="$pkgdir" install
}
