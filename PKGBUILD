# Maintainer: shinrax2
_pkgname=per-device-application-volume
pkgname=pdav-git
pkgver=0.0.1.r2.g8e90257
pkgrel=1
pkgdesc="user daemon to automatically save and restore application volume settings based on default output device for pulseaudio/pipewire-pulse"
arch=(any)
url="https://github.com/shinrax2/per-device-application-volume"
license=('MIT')
depends=('python>=3' 'python-pulsectl' 'systemd' 'pulse-native-provider' 'libpulse')
source=("git+https://github.com/shinrax2/per-device-application-volume.git")
md5sums=('SKIP')
install=pdav.install

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'

}

package() {
    cd $_pkgname
    install -Dm755 "pdav" \
        -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 pdav.service \
        "$pkgdir/etc/systemd/user/pdav.service"
}
