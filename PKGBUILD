# Generated from src/install/autostart.rs by cargo xtask generate

# Maintainer: AlphaJack <19962243+AlphaJack at users dot noreply dot github dot com>

_name=rusticlone
pkgname=$_name-bin
# Set by .github/workflows/aur.yml at each release.
pkgver=2.0.3
pkgrel=1
pkgdesc="Scheduled 3-2-1-1-0 backups for computers and servers built on rustic profiles, with UI and notifications"
arch=('x86_64' 'aarch64')
url="https://github.com/AlphaJack/rusticlone"
license=('AGPL-3.0-or-later')
depends=('rustic')
provides=("$_name")
conflicts=("$_name")
options=('!strip' '!debug')
backup=("etc/$_name/$_name.env")
source_x86_64=("$pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz::$url/releases/download/v$pkgver/$_name-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64-unknown-linux-musl.tar.gz::$url/releases/download/v$pkgver/$_name-aarch64-unknown-linux-musl.tar.gz")
b2sums_x86_64=('8d8cd33486ea064bea8db83f083c35aab0e3ca03dd07ad018443565e9bc2ff04a483e166781a26bd9248863005e9952414a6098645c0eae780f526e2fd16fff9')
b2sums_aarch64=('422a681ddd817a7c0c4201bbf45916c7a539af8cfb9b279674685b1d1fb336baeee782f8b3eee0bd69dd10a755ccd5834c6d501902d106ceb7681b167cbca30f')


_completion(){
 install -d "$pkgdir/usr/share/${2%/*}"
 COMPLETE="$1" "$pkgdir/usr/bin/$_name" | sed "s|$pkgdir||g" > "$pkgdir/usr/share/$2"
}

package(){
 local target
 case "$CARCH" in
  "x86_64") target="x86_64-unknown-linux-musl" ;;
  "aarch64") target="aarch64-unknown-linux-musl" ;;
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
