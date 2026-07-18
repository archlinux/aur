# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
pkgname=omnipackage
pkgver=0.1.16
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
sha256sums=('a9e87f888328428c1f0674d437203c70764ba1b9c53403872b2be3b420376bb2')

build() {
  cd "$srcdir/omnipackage-rs-$pkgver"
  PACKAGE_VERSION="$pkgver" cargo build --release
}

package() {
  cd "$srcdir/omnipackage-rs-$pkgver"
  install -Dm755 target/release/omnipackage "$pkgdir/usr/bin/omnipackage"
}
