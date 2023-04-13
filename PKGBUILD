# Maintainer: Fabio Lenherr <dashie@dashie.org>

pkgname=hyprdock
pkgver="0.3.4"
pkgrel=1
arch=('x86_64')
pkgdir="/usr/bin/${pkgname}"
url="https://github.com/DashieTM/hyprdock"
pkgdesc="An automatic docking tool for hyprland."
depends=('gtk3' 'gtk-layer-shell')
makedepends=('rust' 'gendesk' 'git')
source=("${pkgver}.tar.gz::https://github.com/DashieTM/Hyprdock/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4dea6c4487b72242b93d9bdc6524763b03e6994d36f46a6fd601da57d61d8287  hyprdock-0.3.4.tar.gz')

build() {
  cd hyprdock-${pkgver}
  cargo build --release
}

package() {
  cd hyprdock-${pkgver}
	gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "HyprDock" --categories "Utility;GTK;" --terminal=true
	install -Dm755 target/release/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}

