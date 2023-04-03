# Maintainer: Fabio Lenherr <dashie@dashie.org>

pkgname=hyprdock
pkgver="0.3.3"
pkgrel=1
arch=('x86_64')
pkgdir="/usr/bin/${pkgname}"
url="https://github.com/DashieTM/hyprdock"
pkgdesc="An automatic docking tool for hyprland."
depends=('gtk3' 'gtk-layer-shell')
makedepends=('rust' 'gendesk' 'git')
source=("${pkgver}.tar.gz::https://github.com/DashieTM/Hyprdock/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('691a1445e8fc5bd7b6b5c17c452112292a83b1c1f93420b7a95a1f576f07b7ab')

build() {
  cd hyprdock-${pkgver}
  cargo build --release
}

package() {
  cd hyprdock-${pkgver}
	gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "HyprDock" --categories "Utility;GTK;" --terminal=true
	install -Dm755 target/release/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}

