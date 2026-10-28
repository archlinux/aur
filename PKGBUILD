# Generated from src/install/autostart.rs by cargo xtask generate

# Maintainer: AlphaJack <19962243+AlphaJack at users dot noreply dot github dot com>

_name=rusticlone
pkgname=$_name-bin
# Set by .github/workflows/aur.yml at each release.
pkgver=2.0.1
pkgrel=1
pkgdesc="Scheduled 3-2-1-1-0 backups for computers and servers built on rustic profiles, with UI and notifications"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/AlphaJack/rusticlone"
license=('AGPL-3.0-or-later')
depends=('rustic')
provides=("$_name")
conflicts=("$_name")
options=('!strip' '!debug')
backup=("etc/$_name/$_name.env")
source_x86_64=("$pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz::$url/releases/download/v$pkgver/$_name-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64-unknown-linux-musl.tar.gz::$url/releases/download/v$pkgver/$_name-aarch64-unknown-linux-musl.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7-unknown-linux-musleabihf.tar.gz::$url/releases/download/v$pkgver/$_name-armv7-unknown-linux-musleabihf.tar.gz")
b2sums_x86_64=('73c90d03297c9f5662bf1a5bf706dc7a089d631bf5a1aa69f77475eadf67b4aee100dd53ff2dc4e330ce5ccdf064fd57d278828a0f6bbf83497b1e4c9cbfdadf')
b2sums_aarch64=('62568fce7af3fe22003fb467b61cc0b8265ab7cdc8220dcf2eb7700829301ef904a1f4ab9755ec0b447ea53ce8ea327db450c8a9d73c5f9132bc99df0698dda6')
b2sums_armv7h=('d09dd414b4e513cd4f5eb43fd558b950e8df3eae80da9350ce612bf880ac75a5fd01d712a536a6bd833bb4dcc83318ec7379f0f2aec7b7710a812523d2198518')


_completion(){
 install -d "$pkgdir/usr/share/${2%/*}"
 COMPLETE="$1" "$pkgdir/usr/bin/$_name" | sed "s|$pkgdir||g" > "$pkgdir/usr/share/$2"
}

package(){
 local target
 case "$CARCH" in
  "x86_64") target="x86_64-unknown-linux-musl" ;;
  "aarch64") target="aarch64-unknown-linux-musl" ;;
  "armv7h") target="armv7-unknown-linux-musleabihf" ;;
 esac
 cd "$srcdir/$_name-$target"
 install -D -m 755 $_name "$pkgdir/usr/bin/$_name"
 install -D -m 644 $_name.service "$pkgdir/usr/lib/systemd/system/$_name.service"
 install -D -m 644 $_name.service "$pkgdir/usr/lib/systemd/user/$_name.service"
 install -D -m 600 $_name.env "$pkgdir/etc/$_name/$_name.env"
 install -D -m 644 $_name.desktop "$pkgdir/usr/share/applications/$_name.desktop"
 install -D -m 644 logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_name.svg"
 _completion bash "bash-completion/completions/$_name"
 _completion zsh "zsh/site-functions/_$_name"
 _completion fish "fish/vendor_completions.d/$_name.fish"
}
