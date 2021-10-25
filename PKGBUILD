# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=meli
pkgver=0.7.2
pkgrel=1
pkgdesc="A MUA for the terminal aiming for configurability and extensibility with sane defaults"
arch=('x86_64')
url='https://meli.delivery/'
license=('GPL')
depends=('dbus-glib')
makedepends=('cargo')
source=("https://git.meli.delivery/meli/meli/archive/alpha-$pkgver.tar.gz")
sha256sums=('79114ff38f9f8279cdf1a68f5d45a5786b33bd39fb47c4c522ca240247ef42ae')

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
