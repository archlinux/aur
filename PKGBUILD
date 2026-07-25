# Maintainer: Den <den@nada64.com>
pkgname=nada64
pkgver=1.5.11
pkgrel=1
pkgdesc="Self-hosted system monitor dashboard for a secondary display"
arch=('any')
url="https://nada64.com"
license=('MIT')
depends=('python')
optdepends=('playerctl: now-playing info and playback controls'
            'pciutils: GPU names via lspci'
            'lm_sensors: chassis fan sensors')
source=("$pkgname-$pkgver.tar.gz::https://slop.tools/den-fi/nada64-dashboard/archive/v$pkgver.tar.gz"
        "nada64.service")
sha256sums=('6578a9b464e20bacfeb50c3b22dbf1fdb61891fae9fa55f759221ebcf6cdeaec'
            '0d8a5061fe01c0a6086beb21616a0481ad7036ba75e08a92417abb10d518af01')

package() {
  cd "$srcdir/nada64-dashboard"
  install -Dm755 nada64_linux.py "$pkgdir/usr/bin/nada64"
  sed -i '1s|.*|#!/usr/bin/python3|' "$pkgdir/usr/bin/nada64"
  install -Dm755 enable-cpu-power.sh "$pkgdir/usr/share/nada64/enable-cpu-power.sh"
  install -Dm755 enable-smart.sh "$pkgdir/usr/share/nada64/enable-smart.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/nada64.service" "$pkgdir/usr/lib/systemd/user/nada64.service"
  install -Dm644 "$srcdir/nada64-dashboard/packaging/nada64.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/nada64.svg"
}
