# Maintainer: Sauyon Lee <aur at sjle.co>
pkgname=bin
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="A paste bin written in Rust."
arch=('i686' 'x86_64')
url="https://github.com/w4/bin"
license=('WTFPL')
groups=()
depends=()
makedepends=('rust' 'clang')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/w4/bin/archive/v${pkgver}.tar.gz" 'bin.service' 'Rocket.toml')
sha256sums=('6163f81efa8c3673618a43baf66987590235a52a2e67b08d29985aad50d80747'
            'baff25e9693ad10b482f2e4cc8c1f222f1076d0795cf03f40d595c448d00b56e'
            'dd1f497805fecbaaa231d115234697f11ffe66ddc37b124326d4d83250b1d6a2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$srcdir"

  install -Dm644 bin.service "$pkgdir/usr/lib/systemd/system/bin.service"
  install -Dm644 Rocket.toml "$pkgdir/etc/bin/Rocket.toml"

  install -Dm755 "$pkgname-$pkgver/target/release/bin" "$pkgdir/usr/bin/bin"
}

# vim:set ts=2 sw=2 et:
