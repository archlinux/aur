# Maintainer: shinrax2
_reponame=per-device-application-volume
pkgname=pdav
pkgver=0.3.1
pkgrel=1
pkgdesc="user daemon to automatically save and restore application volume settings based on default output device for pulseaudio/pipewire-pulse"
arch=(any)
url="https://github.com/shinrax2/per-device-application-volume"
license=('MIT')
depends=('python>=3' 'python-pulsectl' 'systemd' 'pulse-native-provider' 'libpulse')
source=("git+https://github.com/shinrax2/per-device-application-volume.git#tag=$pkgver")
conflicts=('pdav-git')
md5sums=('SKIP')
install=pdav.install

build() {
    cd $_reponame
    python3 -m venv .venv
    .venv/bin/python3 -m pip install -r requirements.txt
    .venv/bin/python3 build-gui.py
}

package() {
    cd $_reponame
    install -Dm755 "pdav" -t "$pkgdir/usr/bin"
    install -Dm755 "dist/pdav-gui" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "quirks.json" -t "$pkgdir/usr/share/pdav"
    install -Dm644 "pdav-gui.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "l10n/en.json" -t "$pkgdir/usr/share/pdav/l10n"
    install -Dm644 "l10n/de.json" -t "$pkgdir/usr/share/pdav/l10n"
    install -Dm644 "images/icon-256x256.png" -t "$pkgdir/usr/share/pdav/images"
    install -Dm644 "images/icon-128x128.png" -t "$pkgdir/usr/share/pdav/images"
    install -Dm644 "images/icon-64x64.png" -t "$pkgdir/usr/share/pdav/images"
    install -Dm644 "images/icon-32x32.png" -t "$pkgdir/usr/share/pdav/images"
    install -Dm644 "pdav.service" -t "$pkgdir/etc/systemd/user"
}
