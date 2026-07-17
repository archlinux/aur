# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
pkgname=omnipackage
pkgver=0.1.15
pkgrel=1
pkgdesc="Build and distribute RPM, DEB & Arch packages easily"
arch=('x86_64' 'aarch64')
url="https://omnipackage.org/"
license=('GPL-3.0-or-later')
depends=('gnupg' 'podman')
optdepends=('docker: alternative container runtime (instead of podman)')
makedepends=('rust')
# makepkg defaults LTO on; disable it — breaks linking prebuilt C/asm (aws-lc-rs/ring).
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omnipackage/omnipackage-rs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('945c956293aeebcb728a740d56ac3866a773a028f9e209e3231b284b45dd6878')

build() {
  cd "$srcdir/omnipackage-rs-$pkgver"
  PACKAGE_VERSION="$pkgver" cargo build --release
}

package() {
  cd "$srcdir/omnipackage-rs-$pkgver"
  install -Dm755 target/release/omnipackage "$pkgdir/usr/bin/omnipackage"
}
