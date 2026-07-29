pkgname=livekit-tui-client-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal-based LiveKit client with Zig/Odin video rendering"
arch=('x86_64')
url="https://github.com/TatsuyaM2667/livekit-tui-client"
license=('MIT')
depends=('glibc' 'gcc-libs' 'alsa-lib')
makedepends=('cargo' 'zig' 'odin' 'git')
provides=("livekit-tui-client")
conflicts=("livekit-tui-client")
source=("git+https://github.com/TatsuyaM2667/livekit-tui-client.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/livekit-tui-client"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/livekit-tui-client"
    cargo build --release --bin client
}

package() {
    cd "$srcdir/livekit-tui-client"
    install -Dm755 "target/release/client" "$pkgdir/usr/bin/livekit-tui-client"
}
