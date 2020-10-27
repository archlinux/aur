# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=meli
pkgver=0.6.2
pkgrel=1
pkgdesc="A MUA for the terminal aiming for configurability and extensibility with sane defaults"
arch=('x86_64')
url='https://meli.delivery/'
license=('GPL')
makedepends=('cargo')
source=("https://git.meli.delivery/meli/meli/archive/alpha-$pkgver.tar.gz")
sha256sums=('ae6651d11c5edd449e1a57729c792f5dc425fbc153fa180f9a6a6131d23a19fa')

build() {
  cd "$pkgname"
  cargo build --release --locked --features 'dbus-notifications jmap'
}

package() {
  cd "$pkgname"

  install -Dm755 "target/release/meli" "$pkgdir/usr/bin/meli"

  install -Dm644 docs/meli.1 "$pkgdir/usr/share/man/man1/meli.1"
  install -Dm644 docs/meli.conf.5 "$pkgdir/usr/share/man/man5/meli.conf.5"
  install -Dm644 docs/meli-themes.5 "$pkgdir/usr/share/man/man5/meli-themes.5"
}
