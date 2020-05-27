# Maintainer: Ponas <mykolas.peteraitis@gmail.com>
pkgname="netctl-tray-auto"
pkgver=0.2.0
pkgrel=1
pkgdesc="A lightweight netctl tray app with notifications (netctl-auto)"
arch=('x86_64')
url="https://github.com/PonasKovas/netctl-tray"
license=('MIT')
makedepends=('cargo'
			 'cmake')
depends=('qt5-base'
     	 'polkit')
source=("netctl-tray-${pkgver}.tar.gz::https://github.com/PonasKovas/netctl-tray/archive/${pkgver}.tar.gz")
md5sums=('6764bc400a56ddcd136fb56c1fdf9749')

build () {
  cd "$srcdir/netctl-tray-$pkgver"
  RUSTUP_TOOLCHAIN=nightly \
    cargo build --release --locked --features "auto"
}

package() {
  cd "$srcdir/netctl-tray-$pkgver"
  install -Dm755 target/release/netctl-tray "${pkgdir}/usr/bin/netctl-tray-auto"
  install -d "${pkgdir}/usr/share/netctl-tray-auto/"
  install -Dm644 assets/* "${pkgdir}/usr/share/netctl-tray-auto/"
  install -dm0750 "${pkgdir}/usr/share/polkit-1/rules.d/"
  install -Dm0644 scripts/netctl-tray.rules "${pkgdir}/usr/share/polkit-1/rules.d/netctltrayauto.rules"
}