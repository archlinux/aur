# Maintainer: Ryan Kes <alias+packages@ryankes.eu>
#
# Binary package, not built from source: goreleaser already cross-compiles
# this on every release (.goreleaser.yml), and pulling in a Go toolchain
# just to rebuild what's already sitting on the release page has nothing
# to offer over downloading it.
#
pkgname=hush-hush-cli-bin
pkgver=1.19.3
pkgrel=1
pkgdesc="Client for the hush-hush secrets object store"
arch=('x86_64' 'aarch64')
url="https://github.com/alrayyes/hush-hush-cli"
license=('GPL-3.0-only')
provides=('hush-hush-cli')
conflicts=('hush-hush-cli')
# No rename prefix: the two architectures' upstream filenames are already
# distinct. A shared local name here would make `updpkgsums` silently
# reuse one architecture's download (and its checksum) for the other
# (rules/pkgbuild.md).
source_x86_64=("$url/releases/download/v$pkgver/hush-hush-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/hush-hush-cli_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('98a3797cf369acc227b7b76146772a9e034250caf42911949a61cc82b5a506d3')
sha256sums_aarch64=('450506d063d50253a1347c5fc0057a612d69d4614f8e32096b5eafa8f72507b5')

package() {
  install -Dm755 hush-hush-cli "$pkgdir/usr/bin/hush-hush-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local page
  for page in man1/*.1; do
    install -Dm644 "$page" "$pkgdir/usr/share/man/$page"
  done
}
