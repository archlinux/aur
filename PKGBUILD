# Maintainer: Ponas <mykolas.peteraitis@gmail.com>
pkgname="netctl-tray"
pkgver=0.2.0
pkgrel=2
pkgdesc="A lightweight netctl tray app with notifications"
arch=('x86_64')
url="https://github.com/PonasKovas/netctl-tray"
license=('MIT')
makedepends=('cargo'
			 'cmake')
depends=('qt5-base'
     	 'polkit')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PonasKovas/netctl-tray/archive/${pkgver}.tar.gz")
md5sums=('e3494cc903bd37e5f19a0eb4cd5bfbc9')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=nightly \
    cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/netctl-tray "${pkgdir}/usr/bin/netctl-tray"
  install -d "${pkgdir}/usr/share/netctl-tray/"
  install -Dm644 assets/* "${pkgdir}/usr/share/netctl-tray/"
  install -dm0750 "${pkgdir}/usr/share/polkit-1/rules.d/"
  install -Dm0644 scripts/netctl-tray.rules "${pkgdir}/usr/share/polkit-1/rules.d/netctltray.rules"
}