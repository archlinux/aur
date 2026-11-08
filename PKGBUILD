# Maintainer: Damon Blais <damon.blais@gmail.com>

pkgname=heft-bin
pkgver=0.12.6
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
sha256sums=('7e2bc7448c23d8becf6f8fe6edae259f14d33e1229b318f77e162f173f785e46')
sha256sums_x86_64=('1f0f5334c20545c0b4b54db209436c512fe1e0739614c1625eb5994e29e7f734')
sha256sums_aarch64=('9034c45659a1e7018036e1e210919fe6e2d3f1b474d9bef0f8dd93837409b7ef')

package() {
  # Apache-2.0 is an SPDX common licence shipped in /usr/share/licenses/spdx
  # by the `licenses` package, so this installs no copy of it.
  install -Dm0755 "$srcdir/heft-$pkgver-$CARCH" "$pkgdir/usr/bin/heft"
  install -Dm0644 "$srcdir/heft.bash" "$pkgdir/usr/share/bash-completion/completions/heft"
  install -Dm0644 "$srcdir/_heft" "$pkgdir/usr/share/zsh/site-functions/_heft"
  install -Dm0644 "$srcdir/heft.fish" "$pkgdir/usr/share/fish/vendor_completions.d/heft.fish"
  install -Dm0644 "$srcdir/heft.1" "$pkgdir/usr/share/man/man1/heft.1"
}
