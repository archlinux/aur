# Generated from src/install/autostart/packaging.rs by cargo xtask generate

# Maintainer: AlphaJack <19962243+AlphaJack at users dot noreply dot github dot com>

_name=rusticlone
pkgname=$_name-bin
# Set by .github/workflows/aur.yml at each release.
pkgver=2.1.0
pkgrel=1
pkgdesc="Scheduled 3-2-1-1-0 backups for desktops and servers built on rustic profiles, with UI and notifications"
arch=('x86_64' 'aarch64')
url="https://github.com/AlphaJack/rusticlone"
license=('AGPL-3.0-or-later')
depends=('rustic>=0.12')
optdepends=('rclone: use rclone remotes for rustic repositories')
provides=("$_name")
conflicts=("$_name")
options=('!strip' '!debug')
backup=("etc/$_name/$_name.env")
source_x86_64=("$pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz::$url/releases/download/v$pkgver/$_name-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64-unknown-linux-musl.tar.gz::$url/releases/download/v$pkgver/$_name-aarch64-unknown-linux-musl.tar.gz")
b2sums_x86_64=('04046ec99e3e7786bc7ed1f0c0e0e291330b5d99af440011c42507afe90fbc0607892e5ef12c2916c39c6c3f509d837da433b3262c13b092995e035b1fe12ba6')
b2sums_aarch64=('25fa2139b51075258bf090dfa60f5d4623d9c7619492c7119dcb7526707be1574d811730295c946419f85223a6fff5a255eed95897f4fe4398fc84e2d7982d32')


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
