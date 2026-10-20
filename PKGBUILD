# Maintainer: y0sif <https://github.com/y0sif>
pkgname=whisrs-bin
pkgver=0.1.30
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
sha256sums_x86_64=('ee525cf51a660643bb4bc3a6106b20cd7b96f537101a0bcfe043718641833e3e')
sha256sums_aarch64=('c0d1658775c1e3bdc243ef9081b12a043c351ec2570aa11b152104bd1a82d7bd')

package() {
  install -Dm755 whisrs "$pkgdir/usr/bin/whisrs"
  install -Dm755 whisrsd "$pkgdir/usr/bin/whisrsd"

  install -Dm644 contrib/whisrs.1 "$pkgdir/usr/share/man/man1/whisrs.1"
  install -Dm644 contrib/whisrsd.1 "$pkgdir/usr/share/man/man1/whisrsd.1"

  install -Dm644 contrib/99-whisrs.rules "$pkgdir/usr/lib/udev/rules.d/99-whisrs.rules"
  install -Dm644 contrib/whisrs.service "$pkgdir/usr/lib/systemd/user/whisrs.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
