# Maintainer: Fabio Lenherr <dashie@dashie.org>

pkgname=hyprdock
pkgver="0.3.7"
pkgrel=1
arch=('x86_64')
pkgdir="/usr/bin/${pkgname}"
url="https://github.com/DashieTM/hyprdock"
pkgdesc="An automatic docking tool for hyprland."
depends=('gtk3' 'gtk-layer-shell')
makedepends=('rust' 'gendesk' 'git')
source=("${pkgver}.tar.gz::https://github.com/DashieTM/Hyprdock/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e6a3edf123540df896c84c921f576eae18af77c0980644b3150027371850c01f')

build() {
  cd hyprdock-${pkgver}
  cargo build --release
}

package() {
  cd hyprdock-${pkgver}
	gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "HyprDock" --categories "Utility;GTK;" --terminal=true
	install -Dm755 target/release/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}

