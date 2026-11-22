# Maintainer: y0sif <https://github.com/y0sif>
pkgname=whisrs-bin
pkgver=0.2.2
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
sha256sums_x86_64=('022ffaa8866dda5af848f3b28bf0f372fb833a072ea3a412c5b534d10cae0277')
sha256sums_aarch64=('93b747d359494f4ec99d883762987a62ca075ab55c23618e47b7e019653fefe6')

package() {
  install -Dm755 whisrs "$pkgdir/usr/bin/whisrs"
  install -Dm755 whisrsd "$pkgdir/usr/bin/whisrsd"

  install -Dm644 contrib/whisrs.1 "$pkgdir/usr/share/man/man1/whisrs.1"
  install -Dm644 contrib/whisrsd.1 "$pkgdir/usr/share/man/man1/whisrsd.1"

  install -Dm644 contrib/99-whisrs.rules "$pkgdir/usr/lib/udev/rules.d/99-whisrs.rules"
  install -Dm644 contrib/whisrs.service "$pkgdir/usr/lib/systemd/user/whisrs.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
