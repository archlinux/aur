# vim: filetype=sh ts=2 sw=2 et:
# Maintainer: LinkTed <link.ted@mailbox.org>

pkgname=doh-client
pkgver=1.4.5
pkgrel=1
pkgdesc="doh-client is a DNS over HTTPS client"
arch=("x86_64")
url="https://github.com/LinkTed/doh-client"
license=("BSD 3-Clause")
depends=("ca-certificates-utils")
makedepends=("cargo" "rust" "git")
source=("git+https://github.com/LinkTed/$pkgname.git#tag=v$pkgver")
md5sums=("SKIP")

build() {
  cd $pkgname

  cargo build --release
}

package() {
  cd $pkgname

  install -Dm755 "target/release/doh-client" "$pkgdir/usr/bin/doh-client"
  install -Dm644 "completions/_doh-client" \
                 "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 "completions/doh-client.bash" \
                 "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "completions/doh-client.fish" \
                 "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "usr.bin.doh-client" \
                 "$pkgdir/etc/apparmor.d/usr.bin.doh-client"
  install -Dm644 "doh-client.service" \
                 "$pkgdir/usr/lib/systemd/system/doh-client.service"
  install -Dm644 "doh-client.socket" \
                 "$pkgdir/usr/lib/systemd/system/doh-client.socket"
}
