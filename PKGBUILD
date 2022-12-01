# Maintainer: Thomas Eizinger <thomas@eizinger.io>

# All my PKGBUILDs are managed at https://github.com/thomaseizinger/pkgbuilds

pkgname=rust-punchr-bin
pkgver=0.2.0
pkgrel=0
pkgdesc="Client for measuring Direct Connection Upgrade through Relay (DCUtR) performance"
arch=('x86_64' 'armv7h')
provides=("rust-punchr")
conflicts=("rust-punchr")
url="https://github.com/dennis-tra/punchr"
license=('Apache-2.0')
install=rust-punchr-bin.install
source=(
  "rust-punchr.service"
  "rust-punchr.sysusers"
)
source_x86_64=("rust-punchr-$pkgver-x86_64::${url}/releases/download/rust-client-${pkgver}/x86_64-unknown-linux-gnu")
source_armv7h=("rust-punchr-$pkgver-armv7h::${url}/releases/download/rust-client-${pkgver}/arm-unknown-linux-musleabihf")
sha256sums=('a789b73503094daa4976954895afc3fcfb16cbd9cce5fe55b64d8fb656b90db6'
            '4563585d4b7908b7c3ca4187c8baf68c0940363ed32bd6e6c682410dcafcbffe')
sha256sums_x86_64=('d43812d0749cb7db6e177b4eaf7c6b6ca5fbe9e83941f3751e7f69f8e0806363')
sha256sums_armv7h=('99316898a63864af0beb172ea27722b83cfcf4302ba93f723b1138c3011e7676')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/rust-punchr-$pkgver-$CARCH" "$pkgdir/usr/bin/rust-punchr"
  chmod +x "$pkgdir/usr/bin/rust-punchr"

  install -Dm 0644 "${srcdir}/rust-punchr.service" "${pkgdir}/usr/lib/systemd/system/rust-punchr.service"
  install -Dm 0644 "${srcdir}/rust-punchr.sysusers" "${pkgdir}/usr/lib/sysusers.d/rust-punchr.conf"
}
