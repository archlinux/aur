# Maintainer: Aidan Heeney <aidan.heeney@proton.me>
pkgname=facecast
pkgver=0.1.1
pkgrel=1
pkgdesc="Mirror your desktop to a phone in a Google Cardboard headset (SBS VR, lens correction, audio, wired mode)"
arch=('any')
url="https://github.com/ieatfood314/facecast"
license=('MIT')
depends=('python' 'bash' 'curl' 'iproute2' 'networkmanager' 'xdg-utils')
optdepends=('android-tools: enable tethering and open the viewer on the phone automatically'
            'qrencode: show the viewer URL as a QR code')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6a9bf9611a91a3e85195bed8f37ae2ff991fdf8ae7e34eecac79dc3168633715')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 start.sh "$pkgdir/usr/bin/facecast"
  install -Dm644 server.py index.html vr.html -t "$pkgdir/usr/share/facecast"
  install -Dm644 facecast.service "$pkgdir/usr/lib/systemd/user/facecast.service"
  install -Dm644 facecast.desktop "$pkgdir/usr/share/applications/facecast.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
