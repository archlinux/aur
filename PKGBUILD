# Maintainer: Ryan Kes <alias+packages@ryankes.eu>
#
# Binary package, not built from source: goreleaser already cross-compiles
# this on every release (.goreleaser.yml), and pulling in a Go toolchain
# just to rebuild what's already sitting on the release page has nothing
# to offer over downloading it. hush-hush (the server) has no AUR package
# of its own - it's container-only, see .goreleaser.yml's build config for
# why.
#
pkgname=hush-hush-cli-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Client for the hush-hush secrets object store"
arch=('x86_64' 'aarch64')
url="https://github.com/alrayyes/hush-hush"
license=('GPL-3.0-only')
provides=('hush-hush-cli')
conflicts=('hush-hush-cli')
# No rename prefix: the two architectures' upstream filenames are already
# distinct. A shared local name here once made `updpkgsums` silently reuse
# one architecture's download (and its checksum) for the other.
source_x86_64=("$url/releases/download/v$pkgver/hush-hush-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/hush-hush-cli_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a4da1f0a98d5933b33662186b0cebd559f038a68d0c00a7c5cc8a7528a37905a')
sha256sums_aarch64=('85f0027ed69dd783942bd8a659f5186ac424d9a52752d6287caa7711238c8c7d')

package() {
  install -Dm755 hush-hush-cli "$pkgdir/usr/bin/hush-hush-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local page
  for page in man1/*.1; do
    install -Dm644 "$page" "$pkgdir/usr/share/man/$page"
  done
}
