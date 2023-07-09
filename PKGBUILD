# Maintainer: Jake Stanger <mail@jstanger.dev>

pkgname=mpd-discord-rpc-git
pkgver=v1.7.1.r0.93628d2
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Displays your currently playing song / album / artist from MPD in Discord using Rich Presence."
license=('MIT')
source=('git+https://github.com/JakeStanger/mpd-discord-rpc')
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/mpd-discord-rpc"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/mpd-discord-rpc"
    cargo build --release --locked --target-dir target
}

package() {
  install -Dm 755 "$srcdir/mpd-discord-rpc/target/release/mpd-discord-rpc" "$pkgdir/usr/bin/mpd-discord-rpc"
  install -Dm 644 "$srcdir/mpd-discord-rpc/mpd-discord-rpc.service" "$pkgdir/usr/lib/systemd/user/mpd-discord-rpc.service"
}
