# Contributor: bionade24
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=karlender
_app_id=codes.loers.Karlender
pkgver=0.10.4
pkgrel=1
pkgdesc="An apative GTK-4 calendar app."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/floers/karlender"
license=('GPL-3.0-only')
depends=('libadwaita' 'libnotify')
makedepends=('cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('63e482326e9471ba89a864b948ce1f2163f98d9b6c8c90e9bd05e3dc4d6dd717dbd4cf1508568f98750d2133562799e77a9d000d49a1dd7a0f64c206857ecba8')
options=(!lto)

build() {
  cd "$pkgname-v$pkgver"

  cargo install cargo-gra --locked
  cargo gra gen
  cargo build --release
}

package() {
  cd "$pkgname-v$pkgver"

  make -C target/gra-gen install ROOT="$pkgdir/usr"

  rm "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
