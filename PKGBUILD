# Maintainer: Tiago Correia
#
# AUR package with the static binaries of the GitHub release. scripts/aur.sh
# fills in pkgver and the checksums from the release's SHA256SUMS and writes
# .SRCINFO; see docs/release.md.
pkgname=lazybw-bin
_pkgname=lazybw
pkgver=1.2.1
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
sha256sums_x86_64=('121aebd540dae42b3b9aa71ed54ede28aa79fc8316a0556abadee84a07c0511b')
sha256sums_aarch64=('6eb2d101543445b473cf0402428eb05f3f576b3d658daf56be972e3a31509395')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 lazybw "$pkgdir/usr/bin/lazybw"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
