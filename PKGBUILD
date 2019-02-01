# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

_pkgname=sendxmpp
pkgname=sendxmpp-rs
pkgver=1.0.0
pkgrel=1
pkgdesc="sendxmpp is the XMPP equivalent of sendmail. It is an alternative to the old sendxmpp written in Perl."
url="https://code.moparisthebest.com/moparisthebest/sendxmpp-rs"
makedepends=('cargo')
provides=('sendxmpp' 'sendxmpp-py')
conflicts=('sendxmpp' 'sendxmpp-py')
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
license=('GPL')
backup=('etc/sendxmpp/sendxmpp.toml')
source=("$_pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_pkgname/$pkgver/download"
        "$_pkgname-$pkgver.tar.gz.asc::https://code.moparisthebest.com/attachments/f627adef-0e6b-48af-b57a-01d353b15e58"
       )
validpgpkeys=('81F1C22DD41109D4A9C0A7B5B070F8D97D1A0BBA') # moparisthebest <admin AT moparisthebest.com>
sha256sums=('08cdf3bd4279022c7606f8da6633bea50f968f2761a63268524dbabe9a566e16'
            'a0488ab400730e1e21eddd328de90a3eefb4044eeb2c6773ae2c6607303881f7'
           )

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/sendxmpp "$pkgdir/usr/bin/sendxmpp"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 sendxmpp.toml "${pkgdir}/etc/sendxmpp/sendxmpp.toml"
}
