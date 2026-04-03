pkgbase=shred-extension-rs
pkgname=('shred-extension-rs-nautilus' 'shred-extension-rs-thunar')
pkgver=0.2.0
pkgrel=1
pkgdesc="Secure file shredder extension for Nautilus and Thunar"
arch=('x86_64')
url="https://github.com/williamcanin/shred-extension-rs"
license=('MIT')
makedepends=('cargo' 'rust')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('51d82eff1a1f58d2d37727cafebfcfd066f53af47ca5820b4438c713cd07282b')

build() {
  cd "$pkgbase-$pkgver"

  cargo build -p shred-nautilus --release
  cargo build -p shred-thunar --release
}

package_shred-extension-rs-nautilus() {
  pkgdesc="Secure file shredder extension for Nautilus"
  depends=('nautilus' 'coreutils' 'zenity' 'gcc-libs' 'glibc' 'glib2')
  provides=('shred-extension-rs')
  conflicts=('shred-extension-rs')
  install='nautilus.install'

  cd "$pkgbase-$pkgver"

  install -Dm755 target/release/libshred_nautilus.so \
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

  install -Dm755 target/release/libshred_thunar.so \
    "$pkgdir/usr/lib/thunarx-3/libshred_extension_rs.so"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
