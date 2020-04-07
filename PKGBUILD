# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Mikaela Szekely <qyriad@gmail.com>

pkgname=cargo-update
pkgver=3.0.0
pkgrel=1
pkgdesc="A cargo subcommand for checking and applying updates to installed executables"
arch=( 'x86_64')
url="https://github.com/nabijaczleweli/cargo-update"
license=('MIT')
makedepends=('cargo' 'libssh2' 'openssl')
source=("https://github.com/nabijaczleweli/cargo-update/archive/v${pkgver}.tar.gz")
sha256sums=('0090cac590edcf61c7aa3db534ec02aa67c4d5ae0029da3b4b0c324795d44372')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  RUSTFLAGS="-C target-cpu=native" cargo build --release
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/cargo-install-update" "$pkgdir/usr/bin/cargo-install-update"
  install -Dm755 "target/release/cargo-install-update-config" "$pkgdir/usr/bin/cargo-install-update-config"

  install -Dm644 "man/cargo-install-update.md" "$pkgdir/usr/share/doc/${pkgname}/cargo-install-update.md"
  install -Dm644 "man/cargo-install-update-config.md" "$pkgdir/usr/share/doc/${pkgname}/cargo-install-update-config.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
