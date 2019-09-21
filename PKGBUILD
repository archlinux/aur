# Maintainer: Ponas <mykolas.peteraitis@gmail.com>
pkgname="netctl-tray"
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight netctl tray app with notifications"
arch=('any')
url="https://github.com/PonasKovas/netctl-tray"
license=('MIT')
makedepends=('cargo')
depends=('libnotify')
source=("https://github.com/PonasKovas/netctl-tray/archive/master.tar.gz")
md5sums=('bcfce440a3363a55ba84297cecc8794f')

build () {
  cd "$srcdir/$pkgname-master"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release
}

package() {
  cd "$srcdir/$pkgname-master"
  install -D target/release/netctl-tray "${pkgdir}/usr/bin/netctl-tray"
  install -D scripts/netctltray "${pkgdir}/etc/netctl/hooks/netctltray"
  install -d "${pkgdir}/opt/netctl-tray/"
  install -D scripts/* "${pkgdir}/opt/netctl-tray/"
  install -D assets/* "${pkgdir}/opt/netctl-tray/"
}