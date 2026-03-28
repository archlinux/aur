# Maintainer: Shaun Lastra <shaun@lastra.us>
pkgname=rump
pkgver=0.1.0
pkgrel=1
pkgdesc='Icecast streaming client with GTK4 UI, DJ mic mixing, and auto-ducking'
arch=('x86_64')
url='https://github.com/slastra/rump'
license=('MIT')
depends=('gtk4' 'libadwaita' 'libvorbis' 'libogg' 'pipewire' 'playerctl')
makedepends=('rust' 'cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/slastra/rump/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    # Clear makepkg env vars that interfere with Rust's linker
    unset LDFLAGS CFLAGS CXXFLAGS
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/rump" "$pkgdir/usr/bin/rump"
    install -Dm644 "rump.desktop" "$pkgdir/usr/share/applications/rump.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
