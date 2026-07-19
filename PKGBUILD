# Maintainer: shamrai-nazar <nazar.shamrai@gmail.com>
pkgname=onvif-ptz-viewer-git
pkgver=r20.44217e3
pkgrel=1
pkgdesc="Перегляд ONVIF/RTSP-камери з автопошуком і PTZ-керуванням через mpv"
arch=('any')
url="https://github.com/shamrai-nazar/onvif-ptz-viewer"
license=('MIT')
depends=('mpv' 'python' 'python-pyqt6' 'libnotify' 'xdg-user-dirs')
makedepends=('git')
provides=('onvif-ptz-viewer')
conflicts=('onvif-ptz-viewer')
source=("$pkgname::git+https://github.com/shamrai-nazar/onvif-ptz-viewer.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    install -Dm755 camera-viewer.sh "$pkgdir/usr/bin/camera-viewer"
    install -Dm755 bind_keys.sh "$pkgdir/usr/bin/camera-viewer-bind-keys"

    install -Dm755 ptz_move.sh "$pkgdir/usr/lib/onvif-ptz-viewer/ptz_move.sh"
    install -Dm755 ptz_move.py "$pkgdir/usr/lib/onvif-ptz-viewer/ptz_move.py"
    install -Dm755 ws_discover_camera.py "$pkgdir/usr/lib/onvif-ptz-viewer/ws_discover_camera.py"
    install -Dm755 check-status.sh "$pkgdir/usr/lib/onvif-ptz-viewer/check-status.sh"
    install -Dm644 config/bind_keys.lua "$pkgdir/usr/lib/onvif-ptz-viewer/bind_keys.lua"

    install -Dm755 camera-viewer-tray.py "$pkgdir/usr/bin/camera-viewer-tray"

    install -Dm644 onvif-ptz-viewer.desktop "$pkgdir/usr/share/applications/onvif-ptz-viewer.desktop"
    install -Dm644 camera-viewer-tray.desktop "$pkgdir/etc/xdg/autostart/camera-viewer-tray.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
