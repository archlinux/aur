# Maintainer: Kunobi Ninja <feedback@kunobi.ninja>
# This PKGBUILD is generated/updated by kunobi-ninja/kache CI on each stable
# release (pkgver + checksums refreshed, then pushed to the AUR). It installs
# the official prebuilt, statically linked musl binary from GitHub Releases.
pkgname=kache-bin
pkgver=0.14.1
pkgrel=1
pkgdesc='Content-addressed zero-copy build cache for Rust, C/C++ and more (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/kunobi-ninja/kache'
license=('Apache-2.0')
provides=('kache')
conflicts=('kache')
source_x86_64=("kache-$pkgver-x86_64.tar.gz::https://github.com/kunobi-ninja/kache/releases/download/v$pkgver/kache-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("kache-$pkgver-aarch64.tar.gz::https://github.com/kunobi-ninja/kache/releases/download/v$pkgver/kache-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('4c4f9fbb6fdd6e4d42208adee029c98dbbaae5984672956e568e059eee5cdb89')
sha256sums_aarch64=('82c161f4f5e5ca73fd6af0e0e180be348ba3b23c328c1df9ad0c499ef51a59df')

package() {
  cd "$srcdir"

  # Shell completions (kache ships a `completions` subcommand). Runs the
  # freshly-extracted native binary on the matching-arch build host.
  ./kache completions bash   > kache.bash
  ./kache completions zsh    > kache.zsh
  ./kache completions fish   > kache.fish
  ./kache completions elvish > kache.elvish

  install -Dm0755 kache        "$pkgdir/usr/bin/kache"
  install -Dm0644 kache.bash   "$pkgdir/usr/share/bash-completion/completions/kache"
  install -Dm0644 kache.zsh    "$pkgdir/usr/share/zsh/site-functions/_kache"
  install -Dm0644 kache.fish   "$pkgdir/usr/share/fish/vendor_completions.d/kache.fish"
  install -Dm0644 kache.elvish "$pkgdir/usr/share/elvish/lib/kache.elv"
}
