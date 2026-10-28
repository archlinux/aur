# Generated from src/install/autostart.rs by cargo xtask generate

# Maintainer: AlphaJack <19962243+AlphaJack at users dot noreply dot github dot com>

_name=rusticlone
pkgname=$_name-bin
# Set by .github/workflows/aur.yml at each release.
pkgver=2.0.2
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
b2sums_x86_64=('28fa1c736417e3f141e32b0178d171172b21f489587210f67f52a6cff6d563383edec36fe6a4e0532a55610f71db64f83920c7aa15fd894a0bae2d077ef8a39e')
b2sums_aarch64=('feb8e3543af52f690562884dd0e6abbf35ae25fcddb4cf384871ecdf6830fddfa18b53e141bd13291794778c79bfab535cc128a1705dbfc025f2bb733abda6b4')


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
