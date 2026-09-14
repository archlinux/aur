# Maintainer: Damon Blais <damon.blais@gmail.com>

pkgname=heft-bin
pkgver=0.11.1
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
sha256sums=('4e1e1bd5c6069bf195b90bb9adfae6f1b775dd258e57cb9f0bd674fca7a5f12a')
sha256sums_x86_64=('40f0183bf6a906b1eefd6bb4f68cb3981a4e2c9ab2bd1ff3a8374ae998abad99')
sha256sums_aarch64=('375cf11f282238e4338fdd821193edf5f6d3e9defbb20729efc4266d1cfd1108')

package() {
  # Apache-2.0 is an SPDX common licence shipped in /usr/share/licenses/spdx
  # by the `licenses` package, so this installs no copy of it.
  install -Dm0755 "$srcdir/heft-$pkgver-$CARCH" "$pkgdir/usr/bin/heft"
  install -Dm0644 "$srcdir/heft.bash" "$pkgdir/usr/share/bash-completion/completions/heft"
  install -Dm0644 "$srcdir/_heft" "$pkgdir/usr/share/zsh/site-functions/_heft"
  install -Dm0644 "$srcdir/heft.fish" "$pkgdir/usr/share/fish/vendor_completions.d/heft.fish"
  install -Dm0644 "$srcdir/heft.1" "$pkgdir/usr/share/man/man1/heft.1"
}
