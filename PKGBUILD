# Maintainer: James Farr Gomez <james@nertwork.com>
pkgname=imsg
pkgver=1.0.0
pkgrel=1
pkgdesc="Native Linux Qt6/QML desktop & CLI client for iMessage, RCS, and SMS backed by BlueBubbles"
arch=('x86_64' 'aarch64')
url="https://github.com/nertwork/imsg"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'libnotify')
makedepends=('qt6-base' 'qt6-declarative')
checkdepends=('libheif' 'imagemagick')
optdepends=(
    'libheif: Fast HEIC/HEIF photo attachment decoding'
    'imagemagick: Fallback HEIC/AVIF image conversion'
    'libsecret: Secret Service keyring lookup via secret-tool'
    'pipewire-pulse: Notification sound playback (paplay)'
)
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nertwork/imsg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('025aee701cfce5edafb8e8316b6cc58eba1f17145022fd33b8c2c4f5e3bc0b4c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./bin/build
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    QT_QPA_PLATFORM=offscreen ./bin/test
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 build/imsg "$pkgdir/usr/bin/imsg"
    install -Dm644 pkgbuild/imsg.service "$pkgdir/usr/lib/systemd/user/imsg.service"
    install -Dm644 pkgbuild/imsg.desktop "$pkgdir/usr/share/applications/imsg.desktop"
    install -Dm644 pkgbuild/imsg.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/imsg.svg"
    install -Dm644 resources/imessage-notify.wav "$pkgdir/usr/share/imsg/imessage-notify.wav"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
