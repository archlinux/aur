# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Mikaela Szekely <qyriad@gmail.com>

pkgname=cargo-update
pkgver=8.1.2
pkgrel=1
pkgdesc="A cargo subcommand for checking and applying updates to installed executables"
arch=( 'x86_64')
url="https://github.com/nabijaczleweli/cargo-update"
license=('MIT')
makedepends=('cargo' 'libssh2' 'openssl')
source=("https://github.com/nabijaczleweli/cargo-update/archive/v${pkgver}.tar.gz")
sha256sums=('db9d7460c85661ee94bef03049630830701a71666404e15fcf13dd73a86524e0')

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
