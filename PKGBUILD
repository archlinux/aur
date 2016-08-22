# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=femtomail-git
pkgver=r10.e278dfc
pkgrel=1
pkgdesc="Minimal sendmail replacement for forwarding mail to a single Maildir box"
arch=('i686' 'x86_64')
url="https://git.lekensteyn.nl/femtomail/"
license=('GPL')
provides=('smtp-forwarder')
conflicts=('smtp-forwarder' 'smtp-server')
depends=('glibc')
makedepends=('gcc' 'git')
install="femtomail.install"
source=("git+https://git.lekensteyn.nl/femtomail.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/femtomail"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/femtomail"
  make USERNAME=femtomail MAILBOX_PATH=/var/lib/femtomail
}

package() {
  cd "$srcdir/femtomail"
  make install-link-sendmail DESTDIR="$pkgdir" sbindir=/usr/bin
}
