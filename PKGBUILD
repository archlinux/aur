# Maintainer: Tiago Correia
#
# AUR package with the static binaries of the GitHub release. scripts/aur.sh
# fills in pkgver and the checksums from the release's SHA256SUMS and writes
# .SRCINFO; see docs/RELEASE.md.
pkgname=ratclone-bin
_pkgname=ratclone
pkgver=0.1.1
pkgrel=1
pkgdesc="A keyboard-driven terminal UI for rclone (static binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/SyscallBrain/ratclone"
license=('MIT')
depends=('rclone')
optdepends=('ttf-nerd-fonts-symbols: icons (or set icons = "ascii")')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('18ca5a0788d176899f284edd344a75e272fa4c7abff622ccc1bfaac24559f1f0')
sha256sums_aarch64=('ca4005a65b5caa805dd52f375de92fef9bb5b080d74e47ff417f1c23501cc7ac')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 ratclone "$pkgdir/usr/bin/ratclone"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
