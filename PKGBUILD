# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="rustic-rs-bin"
pkgver="nightly"
pkgrel=1
pkgdesc="Fast, encrypted, deduplicated backups powered by Rust"
url="https://rustic.cli.rs/docs/nightly_builds.html"
arch=("x86_64" "aarch64" "i686" "armv7h")
provides=("rustic")
conflicts=("rustic" "rustic-rs" "rustic-bin")
license=("Apache")
source=("rustic-completions."{ba,fi,z}"sh")
source_x86_64=("https://github.com/rustic-rs/nightly/raw/main/rustic/rustic-nightly-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/rustic-rs/nightly/raw/main/rustic/rustic-nightly-aarch64-unknown-linux-gnu.tar.gz")
source_i686=("https://github.com/rustic-rs/nightly/raw/main/rustic/rustic-nightly-i686-unknown-linux-gnu.tar.gz")
source_armv7h=("https://github.com/rustic-rs/nightly/raw/main/rustic/rustic-nightly-armv7-unknown-linux-gnueabihf.tar.gz")
validpgpkeys=("12B7166D9FD59124416952E34018C5DE3BF8C081")
b2sums=("5e184527218e69900f12f97894f82de78a6b1eec7472dfa5f4b88367a4d4def7498e9400bd5b188235796af440e118c6fd056391fcf8cbd09207cad6c9664890"
        "b88914c1a59a693bc187f4d237ba39f31d1d6d4081aaef92c10bd67db79f14cc4ad9059a6bb15c45025f551ea7e4a00fbb81de3680a40f32a2aeb694a49f8052"
        "20dab9a8506984f31b47473f647470ddb3cae589d662e7f6691f9f70d639e4c4cf7a047fe44fe93960b9f0db3dff99533d9241e11471fb5274270e5bb197db2d")
b2sums_x86_64=("SKIP")
b2sums_aarch64=("SKIP")
b2sums_i686=("SKIP")
b2sums_armv7h=("SKIP")

package(){
  case "$CARCH" in
  "x86_64") cd "rustic-x86_64-unknown-linux-gnu";;
  "aarch64") cd "rustic-aarch64-unknown-linux-gnu";;
  "i686") cd "rustic-i686-unknown-linux-gnu";;
  "armv7h") cd "rustic-armv7-unknown-linux-gnueabih";;
  *) echo "Architecture not supported" && exit 1;;
  esac
  install -d "$pkgdir/usr/share/rustic"
  cp -r "config" "$pkgdir/usr/share/rustic"
  install -D -m 755 "rustic" -t "$pkgdir/usr/bin"
  install -D -m 644 "$srcdir/rustic-completions.bash" "$pkgdir/usr/share/bash-completion/completions/rustic"
  install -D -m 644 "$srcdir/rustic-completions.fish" "$pkgdir/usr/share/fish/vendor_completions.d/rustic.fish"
  install -D -m 644 "$srcdir/rustic-completions.zsh" "$pkgdir/usr/share/zsh/site-functions/_rustic"
}
