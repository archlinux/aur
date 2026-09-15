# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
pkgname=omnipackage
pkgver=0.1.19
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
sha256sums=('600f88e8d0955aa185054a18a54de61c32825a18b4ed3ab309604a8dfeebc8fb')

build() {
  cd "$srcdir/omnipackage-rs-$pkgver"
  PACKAGE_VERSION="$pkgver" cargo build --release
}

package() {
  cd "$srcdir/omnipackage-rs-$pkgver"
  install -Dm755 target/release/omnipackage "$pkgdir/usr/bin/omnipackage"
}
