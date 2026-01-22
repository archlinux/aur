# Maintainer:   purple <discord ypurpl>
# Contributor:  reeeeeeeeeeelity <rility3 AT GMAIL>
# Contributor:  Thang Pham <phamducthang1234 at gmail dot com
# Contributor:  FabioLolix
pkgname=spotify-player-feats-git
_pkgname=spotify-player
pkgver=0.21.3.r1.g9ccb5bf
pkgrel=1
pkgdesc="A TUI spotify player (All features enabled while keeping defaults)."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('libpulse' 'openssl' 'dbus' 'libsixel' 'libnotify' 'fzf')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url#branch=master")
sha256sums=("SKIP")
options=('!lto')


pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  cargo build --frozen --release \
		 --features notify,daemon,image,pixelate,sixel,fzf
}

package() {
    cd "${pkgname}"
    install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
