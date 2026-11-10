# Maintainer: Tiago Correia
#
# AUR package with the static binaries of the GitHub release. scripts/aur.sh
# fills in pkgver and the checksums from the release's SHA256SUMS and writes
# .SRCINFO; see docs/release.md.
pkgname=lazybw-bin
_pkgname=lazybw
pkgver=1.2.0
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
sha256sums_x86_64=('ef99f0a47e52b54d6183390980084062e38e61c863f8c5afb31c614ffada3e25')
sha256sums_aarch64=('1d9a7a8167e78fe8ec5f621e423cd8f990449df503c1658a279596653eee7617')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 lazybw "$pkgdir/usr/bin/lazybw"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
