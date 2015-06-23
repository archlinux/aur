# Maintainer: aksr <aksr at t-com dot me>
pkgname=nmh-git
pkgver=1.6+dev.r2608
pkgrel=1
epoch=
pkgdesc="Powerful electronic mail handling system, based on a set of command-line utilities."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/nmh/"
license=('BSD')
groups=()
depends=('db' 'openssl' 'libsasl')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('nmh')
conflicts=('nmh')
replaces=()
backup=(etc/nmh/components
        etc/nmh/digestcomps
        etc/nmh/distcomps
        etc/nmh/forwcomps
        etc/nmh/MailAliases
        etc/nmh/mhl.body
        etc/nmh/mhl.digest
        etc/nmh/mhl.format
        etc/nmh/mhl.forward
        etc/nmh/mhl.headers
        etc/nmh/mhl.reply
        etc/nmh/mhn.defaults
        etc/nmh/mts.conf
        etc/nmh/rcvdistcomps
        etc/nmh/rcvdistcomps.outbox
        etc/nmh/replcomps
        etc/nmh/replgroupcomps
        etc/nmh/scan.default
        etc/nmh/scan.highlighted
        etc/nmh/scan.mailx
        etc/nmh/scan.MMDDYY
        etc/nmh/scan.nomime
        etc/nmh/scan.size
        etc/nmh/scan.time
        etc/nmh/scan.timely
        etc/nmh/scan.unseen
        etc/nmh/scan.YYYYMMDD)
changelog=
install=
source=("$pkgname::git://git.sv.gnu.org/nmh.git")
noextract=()
options=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s" "$(cat -s VERSION)" "$(git rev-list --count HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr         \
              --sysconfdir=/etc     \
              --libexecdir=/usr/lib \
              --with-cyrus-sasl     \
              --with-tls
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/"
}

