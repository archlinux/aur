# Maintainer: Jake Stanger <mail@jstanger.dev>

pkgname=mpd-discord-rpc-git
pkgver=v1.6.0.r1.ee29533
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
}
