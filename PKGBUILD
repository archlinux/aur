# Maintainer: Fabio Lenherr <dashie@dashie.org>

pkgname=hyprdock
pkgver="0.3.2"
pkgrel=1
arch=('x86_64')
pkgdir="/usr/bin/${pkgname}"
url="https://github.com/DashieTM/hyprdock"
pkgdesc="An automatic docking tool for hyprland."
depends=('gtk3' 'gtk-layer-shell')
makedepends=('rust' 'gendesk' 'git')
source=("${pkgver}.tar.gz::https://github.com/DashieTM/Hyprdock/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('be300650baf8b89f01845642991002da122c0245049434ab3aae75006f5ff4f1')

build() {
  cd hyprdock-${pkgver}
  cargo build --release
}

package() {
  cd hyprdock-${pkgver}
	gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "HyprDock" --categories "Utility;GTK;" --terminal=true
	install -Dm755 target/release/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}

