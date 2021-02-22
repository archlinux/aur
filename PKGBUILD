# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname=moonraker-git
pkgver=r396.1f61357
pkgrel=1
pkgdesc="HTTP frontend for Klipper 3D printer firmware"
arch=(any)
url="https://github.com/Arksine/moonraker"
license=('GPLv3')
depends=(klipper
         python-tornado
         python-pillow
         python-pyserial
         libgpiod)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Arksine/moonraker.git#branch=master' 'moonraker.conf' 'moonraker.service' 'tmpfiles.conf' 'moonraker-klipper.cfg')
sha256sums=('SKIP'
            '356dc03a6119adc088f3feacc0a7d7f52d2f569e6189b12263b9baf69a47a1d3'
            '120c85c212ec57c1365e3e94f9d38ba9a5d9bd57e76692733e7cd8fe167afff0'
            'd6b0dbe53e9e53d2dc0bb156ac9bf2700f0daae63436e4889749de1f2e111738'
            'c532d594c92404820d6cdb8407420a7f9bb65e05d8fdbc2db498f940bb3ffcc3')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -dm755 "$pkgdir/etc/moonraker"
  install -Dm644 "$srcdir/moonraker.conf" "$pkgdir/etc/klipper/moonraker.conf"
  install -Dm644 "$srcdir/moonraker.service" "$pkgdir/usr/lib/systemd/system/moonraker.service"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/moonraker.conf"
  install -Dm644 "$srcdir/moonraker-klipper.cfg" "$pkgdir/usr/share/doc/moonraker/moonraker-klipper.cfg"

  install -dm755 "$pkgdir/opt/moonraker"
  GLOBIGNORE=.git cp -r * "$pkgdir/opt/moonraker"
}
