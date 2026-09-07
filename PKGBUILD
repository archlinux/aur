# Maintainer: y0sif <https://github.com/y0sif>
pkgname=whisrs-bin
pkgver=0.1.27
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
sha256sums_x86_64=('b6a08cb9babff70b32f6908d043029dda24ccda2eba989b83c687d86b28b263a')
sha256sums_aarch64=('73e30b730e0214870673d27defc28ec3b30becc16398eed77d6a17d238bc8d0b')

package() {
  install -Dm755 whisrs "$pkgdir/usr/bin/whisrs"
  install -Dm755 whisrsd "$pkgdir/usr/bin/whisrsd"

  install -Dm644 contrib/whisrs.1 "$pkgdir/usr/share/man/man1/whisrs.1"
  install -Dm644 contrib/whisrsd.1 "$pkgdir/usr/share/man/man1/whisrsd.1"

  install -Dm644 contrib/99-whisrs.rules "$pkgdir/usr/lib/udev/rules.d/99-whisrs.rules"
  install -Dm644 contrib/whisrs.service "$pkgdir/usr/lib/systemd/user/whisrs.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
