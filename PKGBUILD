# Maintainer: Ron <thefangeddeity>
pkgname=hls-livecam-server
pkgver=2.7.3
pkgrel=2
pkgdesc="Stream a USB webcam via HLS using MediaMTX and ffmpeg, with browser viewer, camstack monitor, and family presence features"
arch=('any')
url="https://github.com/thefangeddeity/hls-livecam-server"
license=('GPL-3.0-or-later')
depends=('ffmpeg' 'nginx' 'python' 'python-psutil' 'python-flask' 'smartmontools' 'v4l-utils' 'wget')
install=hls-livecam-server.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/thefangeddeity/hls-livecam-server/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('67284dd05fbff5e20abb64f0da198d1b6be22396a35e541bb9191b915531f889')

package() {
    cd "$pkgname-$pkgver"

    # Executables
    install -Dm755 pkg/usr/local/bin/camstack           "$pkgdir/usr/local/bin/camstack"
    install -Dm755 pkg/usr/local/bin/hls-livecam-setup  "$pkgdir/usr/local/bin/hls-livecam-setup"
    install -Dm755 pkg/usr/local/bin/hls-livecam-repair "$pkgdir/usr/local/bin/hls-livecam-repair"
    install -Dm755 pkg/usr/local/bin/hls-livecam-dark   "$pkgdir/usr/local/bin/hls-livecam-dark"
    install -Dm755 pkg/usr/local/bin/broadcast-api      "$pkgdir/usr/local/bin/broadcast-api"

    # Shared data
    install -Dm755 pkg/usr/share/hls-livecam-server/camstack           "$pkgdir/usr/share/hls-livecam-server/camstack"
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-setup  "$pkgdir/usr/share/hls-livecam-server/hls-livecam-setup"
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-repair "$pkgdir/usr/share/hls-livecam-server/hls-livecam-repair"
    install -Dm644 pkg/usr/share/hls-livecam-server/block_art.py       "$pkgdir/usr/share/hls-livecam-server/block_art.py"
    install -Dm644 pkg/usr/share/hls-livecam-server/index.html         "$pkgdir/usr/share/hls-livecam-server/index.html"
    install -Dm644 pkg/usr/share/hls-livecam-server/ffmpeg-cam.service "$pkgdir/usr/share/hls-livecam-server/ffmpeg-cam.service"

    # Web root
    install -Dm644 pkg/var/www/hls-livecam/index.html  "$pkgdir/var/www/hls-livecam/index.html"

    # Systemd services
    install -Dm644 pkg/etc/systemd/system/broadcast-api.service    "$pkgdir/usr/lib/systemd/system/broadcast-api.service"
    install -Dm644 pkg/etc/systemd/system/ffmpeg-cam-dark.service   "$pkgdir/usr/lib/systemd/system/ffmpeg-cam-dark.service"

    # Sudoers
    install -Dm440 pkg/etc/sudoers.d/hls-livecam-dark "$pkgdir/etc/sudoers.d/hls-livecam-dark"
}
