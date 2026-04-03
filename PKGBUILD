pkgbase=shred-extension-rs
pkgname=('shred-extension-rs-nautilus' 'shred-extension-rs-thunar')
pkgver=0.1.0
pkgrel=1
pkgdesc="Secure file shredder extension for Nautilus and Thunar"
arch=('x86_64')
url="https://github.com/williamcanin/shred-extension-rs"
license=('MIT')
makedepends=('cargo' 'rust')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('964707023f48e43ce8afe5fcef61598c5d51f6ce2fb7b120e27d442449c29e8c')

build() {
  cd "$pkgbase-$pkgver"

  CARGO_TARGET_DIR=target-nautilus \
    cargo build --release --locked --features nautilus

  CARGO_TARGET_DIR=target-thunar \
    cargo build --release --locked --features thunar
}

package_shred-extension-rs-nautilus() {
  pkgdesc="Secure file shredder extension for Nautilus"
  depends=('nautilus' 'coreutils' 'zenity' 'gcc-libs' 'glibc' 'glib2')
  provides=('shred-extension-rs')
  conflicts=('shred-extension-rs')
  install='nautilus.install'

  cd "$pkgbase-$pkgver"

  install -Dm755 target-nautilus/release/libshred_extension_rs.so \
    "$pkgdir/usr/lib/nautilus/extensions-4/libshred_extension_rs.so"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_shred-extension-rs-thunar() {
  pkgdesc="Secure file shredder extension for Thunar"
  depends=('thunar' 'coreutils' 'zenity' 'gcc-libs' 'glibc' 'glib2')
  provides=('shred-extension-rs')
  conflicts=('shred-extension-rs')
  install='thunar.install'

  cd "$pkgbase-$pkgver"

  install -Dm755 target-thunar/release/libshred_extension_rs.so \
    "$pkgdir/usr/lib/thunarx-3/libshred_extension_rs.so"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}