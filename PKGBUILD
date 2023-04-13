# Maintainer: Fabio Lenherr <dashie@dashie.org>

pkgname=hyprdock
pkgver="0.3.5"
pkgrel=1
arch=('x86_64')
pkgdir="/usr/bin/${pkgname}"
url="https://github.com/DashieTM/hyprdock"
pkgdesc="An automatic docking tool for hyprland."
depends=('gtk3' 'gtk-layer-shell')
makedepends=('rust' 'gendesk' 'git')
source=("${pkgver}.tar.gz::https://github.com/DashieTM/Hyprdock/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8de3d36bfc701e9bab16e8d4dffcd9c98968207af9612cc097e4afc6e0a4dafb')

build() {
  cd hyprdock-${pkgver}
  cargo build --release
}

package() {
  cd hyprdock-${pkgver}
	gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "HyprDock" --categories "Utility;GTK;" --terminal=true
	install -Dm755 target/release/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}

