# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Mikaela Szekely <qyriad@gmail.com>

pkgname=cargo-update
pkgver=11.1.1
pkgrel=1
pkgdesc="A cargo subcommand for checking and applying updates to installed executables"
arch=( 'x86_64')
url="https://github.com/nabijaczleweli/cargo-update"
license=('MIT')
makedepends=('libssh2' 'openssl')
depends=('cargo')
source=("https://github.com/nabijaczleweli/cargo-update/archive/v${pkgver}.tar.gz")
sha256sums=('8fb09783708c50ee17a2279c3d1a6fd41cde2a294c0d58fd206a569ea338c435')

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
