# Maintainer: y0sif <https://github.com/y0sif>
pkgname=whisrs-bin
pkgver=0.1.29
pkgrel=1
pkgdesc='Linux-first voice-to-text dictation tool, written in Rust (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/y0sif/whisrs'
license=('MIT')
depends=('gcc-libs' 'alsa-lib' 'libxkbcommon')
provides=("whisrs=$pkgver")
conflicts=('whisrs' 'whisrs-git')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/whisrs-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/whisrs-linux-aarch64.tar.gz")
sha256sums_x86_64=('b18e3a92b4f740e47919bab1e8031c55b12479da542a714616ad854ef6875033')
sha256sums_aarch64=('73dc508a67077f8460459e37bf835fab351adb0cabb9bf49b07c50e86c8ffe14')

package() {
  install -Dm755 whisrs "$pkgdir/usr/bin/whisrs"
  install -Dm755 whisrsd "$pkgdir/usr/bin/whisrsd"

  install -Dm644 contrib/whisrs.1 "$pkgdir/usr/share/man/man1/whisrs.1"
  install -Dm644 contrib/whisrsd.1 "$pkgdir/usr/share/man/man1/whisrsd.1"

  install -Dm644 contrib/99-whisrs.rules "$pkgdir/usr/lib/udev/rules.d/99-whisrs.rules"
  install -Dm644 contrib/whisrs.service "$pkgdir/usr/lib/systemd/user/whisrs.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
