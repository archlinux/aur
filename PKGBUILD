# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=sendxmpp-rs-git
pkgver=1.0.0.r0.g12ea8c5
pkgrel=1
pkgdesc="sendxmpp is the XMPP equivalent of sendmail. It is an alternative to the old sendxmpp written in Perl."
url="https://code.moparisthebest.com/moparisthebest/sendxmpp-rs"
makedepends=('cargo' 'git')
provides=('sendxmpp' 'sendxmpp-py')
conflicts=('sendxmpp' 'sendxmpp-py')
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
license=('GPL')
backup=('etc/sendxmpp/sendxmpp.toml')
source=("$pkgname::git+https://code.moparisthebest.com/moparisthebest/sendxmpp-rs.git")
validpgpkeys=('81F1C22DD41109D4A9C0A7B5B070F8D97D1A0BBA') # moparisthebest <admin AT moparisthebest.com>
sha256sums=(SKIP)
conflicts=(sendxmpp-rs)
provides=(sendxmpp-rs=$pkgver)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  cargo fetch
}

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/sendxmpp "$pkgdir/usr/bin/sendxmpp"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 sendxmpp.toml "${pkgdir}/etc/sendxmpp/sendxmpp.toml"
}
