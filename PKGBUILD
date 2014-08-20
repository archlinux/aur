# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=syncmaildir
pkgver=1.2.6
pkgrel=2
pkgdesc="Synchronize a pair of mailboxes in Maildir format via ssh"
arch=(i686 x86_64)
url="http://syncmaildir.sourceforge.net/"
license=('GPL3')
depends=('lua51' 'xdelta')
makedepends=('txt2man' 'vala' 'libgee06' 'libnotify' 'gconf' 'gtk3')
checkdepends=('moreutils') # "combine" tool
optdepends=(
  "gconf: for smd-applet"
  "gtk3: for smd-applet"
  "libgee06: for smd-applet"
  "libnotify: for smd-applet"
)
options=(!emptydirs)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz
        'build.patch')
md5sums=('a619d14178b4cd236a51b959fb5f3f54'
         'd88607a162e49b31301c7aa87e8f4d1c')
sha256sums=('0c28ae16a098e5b0376717d4171f9422d0a1541e5a38873d7caf454896a8d051'
            '8b38cd5b64a30f11e81ad4278c21080dc1b0c79a0cfaf69742f6207085e9a5d0')
install="syncmaildir.install"

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 < "$srcdir/build.patch"
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
