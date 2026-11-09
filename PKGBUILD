# Maintainer: Tiago Correia
#
# AUR package with the static binaries of the GitHub release. scripts/aur.sh
# fills in pkgver and the checksums from the release's SHA256SUMS and writes
# .SRCINFO; see docs/release.md.
pkgname=lazybw-bin
_pkgname=lazybw
pkgver=1.1.0
pkgrel=1
pkgdesc="A keyboard-first terminal UI for the Bitwarden vault (static binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/SyscallBrain/lazybw"
license=('MIT')
depends_x86_64=('bitwarden-cli')
optdepends_aarch64=('bitwarden-cli: the Bitwarden CLI that lazybw drives (or npm i -g @bitwarden/cli)')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('17277478b082c01a40675702f1f1ba292330a98aa19fcd148bee751241b30712')
sha256sums_aarch64=('784845ac3a30b299a91ae814afd2e4cc59f47b0075d9aa613513e2b61c1f97da')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 lazybw "$pkgdir/usr/bin/lazybw"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
