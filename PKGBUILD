# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=arptables-git
pkgver=0.0.5.r0.gefae894
pkgrel=1
pkgdesc="ARP filtering utility"
arch=('i686' 'x86_64')
url="https://ebtables.netfilter.org/"
license=('GPL2')
depends=('glibc' 'perl')
makedepends=('git')
provides=('arptables')
conflicts=('arptables')
backup=('etc/arptables.conf')
source=("git://git.netfilter.org/arptables"
        "arptables.service::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/iptables/trunk/arptables.service")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "arptables"

  git describe --long --tags | sed 's/^arptables-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "arptables"

  make
}

package() {
  cd "arptables"

  make \
    DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    LIBDIR="/usr/lib/arptables" \
    BINDIR="/usr/bin" \
    MANDIR="/usr/share/man" \
    install

  install -Dm644 "$srcdir/arptables.service" \
    "$pkgdir/usr/lib/systemd/system/arptables.service"

  install -Dm644 /dev/null "$pkgdir/etc/arptables.conf"
}
