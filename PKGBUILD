# Generated from src/install/autostart.rs by cargo xtask generate

# Maintainer: AlphaJack <19962243+AlphaJack at users dot noreply dot github dot com>

_name=rusticlone
pkgname=$_name-bin
# Set by .github/workflows/aur.yml at each release.
pkgver=2.0.4
pkgrel=1
pkgdesc="Scheduled 3-2-1-1-0 backups for desktops and servers built on rustic profiles, with UI and notifications"
arch=('x86_64' 'aarch64')
url="https://github.com/AlphaJack/rusticlone"
license=('AGPL-3.0-or-later')
depends=('rustic')
optdepends=('rclone: use rclone remotes for rustic repositories')
provides=("$_name")
conflicts=("$_name")
options=('!strip' '!debug')
backup=("etc/$_name/$_name.env")
source_x86_64=("$pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz::$url/releases/download/v$pkgver/$_name-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64-unknown-linux-musl.tar.gz::$url/releases/download/v$pkgver/$_name-aarch64-unknown-linux-musl.tar.gz")
b2sums_x86_64=('4292ce98fe6fe1667c0f7a7a7525f1a88b93929a5a7e08e03d6b8e838efc896223eabfa9a2068a7b2bb2d36f0f810eae317efd40c6a96d3ab793861c7e7f874c')
b2sums_aarch64=('f5b671c468cc89064e198f3dc4e055cff486d087fe5321ebd18b5baf3c70e9c75322491a4d56d47ebc4b7a08b3d065140d4c59e9a48c33703777e69b216445f1')


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
