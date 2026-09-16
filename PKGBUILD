# Maintainer: Damon Blais <damon.blais@gmail.com>

pkgname=heft-bin
pkgver=0.12.0
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
sha256sums=('0884a21de2961f1eb96f8feb91fb991b1d4aff86e8f622b37d82bd5384181860')
sha256sums_x86_64=('38e07147d76bd476a5ab08426d459dba835bc2eb0098ed5611577218454044b6')
sha256sums_aarch64=('e755f6e75aa51b5330f9d7cd947c50be123d1a5d2d360e6ffce08a114bd7ea70')

package() {
  # Apache-2.0 is an SPDX common licence shipped in /usr/share/licenses/spdx
  # by the `licenses` package, so this installs no copy of it.
  install -Dm0755 "$srcdir/heft-$pkgver-$CARCH" "$pkgdir/usr/bin/heft"
  install -Dm0644 "$srcdir/heft.bash" "$pkgdir/usr/share/bash-completion/completions/heft"
  install -Dm0644 "$srcdir/_heft" "$pkgdir/usr/share/zsh/site-functions/_heft"
  install -Dm0644 "$srcdir/heft.fish" "$pkgdir/usr/share/fish/vendor_completions.d/heft.fish"
  install -Dm0644 "$srcdir/heft.1" "$pkgdir/usr/share/man/man1/heft.1"
}
