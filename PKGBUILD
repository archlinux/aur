# Maintainer: Ryan Kes <alias+packages@ryankes.eu>
#
# Binary package, not built from source: goreleaser already cross-compiles
# this on every release (.goreleaser.yml), and pulling in a Go toolchain
# just to rebuild what's already sitting on the release page has nothing
# to offer over downloading it.
#
pkgname=hush-hush-cli-bin
pkgver=1.5.2
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
sha256sums_x86_64=('2a16b4337b289a05a082ee2110836e4aeed266b934912dc0a3d7005d4019ded6')
sha256sums_aarch64=('12c08206dfcc82cd0820f8905b2ba9ca2f292269249ca45cf551f0aedf1ff798')

package() {
  install -Dm755 hush-hush-cli "$pkgdir/usr/bin/hush-hush-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local page
  for page in man1/*.1; do
    install -Dm644 "$page" "$pkgdir/usr/share/man/$page"
  done
}
