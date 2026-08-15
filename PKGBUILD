# Maintainer: abod8639 <https://github.com/abod8639>
pkgname=toff
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI shutdown timer with YouTube/media URL support"
arch=('any')
url="https://github.com/abod8639/toff"
license=('MIT')
install=toff.install
depends=(
    'bash'          # >= 4.0 required
    'yt-dlp'        # URL/media duration extraction
    'util-linux'    # getopt, shutdown
)
optdepends=(
    'libnotify: desktop notifications on shutdown'
    'at: alternative scheduling backend (atd must be running)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('12657c407b3a4192244b290fa276b15d92e71cfc37daa04958bb8bac4c0a43c7cb490f9c4409465bfa9628466e07ac88a03896c5c4536092769e73167b18d856')

# ── sudoers snippet for non-systemd systems ────────────────────────────────
# On systemd (default Arch), logind handles poweroff — no sudo needed.
# Uncomment the block below in post_install() if targeting non-systemd systems.

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

