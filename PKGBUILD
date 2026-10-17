# Maintainer: Damon Blais <damon.blais@gmail.com>

pkgname=heft-bin
pkgver=0.12.2
pkgrel=1
pkgdesc="Read-only Linux TUI for application-weight process accounting"
arch=('x86_64' 'aarch64')
url="https://github.com/Rethunk-Tech/heft"
license=('Apache-2.0')
# [profile.release] already strips, so there is nothing for makepkg to strip or
# to put in a debug package.
options=('!strip' '!debug')
provides=("heft=$pkgver")
conflicts=('heft')
# The musl builds are static, so this package has no depends at all: heft
# needs sysconf and geteuid from libc and reads /etc/passwd itself, so there
# is no NSS lookup to link against.
_url_rel="$url/releases/download/v$pkgver"
source=("heft-completions-man-$pkgver.tar.gz::$_url_rel/heft-completions-man.tar.gz")
source_x86_64=("heft-$pkgver-x86_64::$_url_rel/heft-x86_64-unknown-linux-musl")
source_aarch64=("heft-$pkgver-aarch64::$_url_rel/heft-aarch64-unknown-linux-musl")
sha256sums=('67cdcb8dcf553142bccfa94df28d49f10a101572e3ed55ecee1a2a929b5f0297')
sha256sums_x86_64=('c9a367595d38c9bfa6b3671c5fd2d5ffc996d8b7f6541b61cd88eb84fae43399')
sha256sums_aarch64=('d449302c54a33db342154dead5de195bc0a29560a589e25bde38baa495879ba3')

package() {
  # Apache-2.0 is an SPDX common licence shipped in /usr/share/licenses/spdx
  # by the `licenses` package, so this installs no copy of it.
  install -Dm0755 "$srcdir/heft-$pkgver-$CARCH" "$pkgdir/usr/bin/heft"
  install -Dm0644 "$srcdir/heft.bash" "$pkgdir/usr/share/bash-completion/completions/heft"
  install -Dm0644 "$srcdir/_heft" "$pkgdir/usr/share/zsh/site-functions/_heft"
  install -Dm0644 "$srcdir/heft.fish" "$pkgdir/usr/share/fish/vendor_completions.d/heft.fish"
  install -Dm0644 "$srcdir/heft.1" "$pkgdir/usr/share/man/man1/heft.1"
}
