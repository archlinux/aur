# Maintainer: Ponas <mykolas.peteraitis@gmail.com>
pkgname="netctl-tray"
pkgver=0.1.0
pkgrel=5
pkgdesc="A lightweight netctl tray app with notifications"
arch=('any')
url="https://github.com/PonasKovas/netctl-tray"
license=('MIT')
makedepends=('cargo')
depends=('libnotify'
		 'qt5-base')
source=("https://github.com/PonasKovas/netctl-tray/archive/master.tar.gz")
md5sums=('e3fccdf6d9a1bdc3ea3802438c251b4b')

build () {
  cd "$srcdir/$pkgname-master"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-master"
  install -Dm755 target/release/netctl-tray "${pkgdir}/usr/bin/netctl-tray"
  install -Dm755 scripts/netctltray "${pkgdir}/etc/netctl/hooks/netctltray"
  install -d "${pkgdir}/usr/share/netctl-tray/"
  install -Dm755 scripts/* "${pkgdir}/usr/share/netctl-tray/"
  install -Dm644 assets/* "${pkgdir}/usr/share/netctl-tray/"
}