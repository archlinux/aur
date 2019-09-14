# Maintainer: Sauyon Lee <aur at sjle.co>
pkgname=bin
pkgver=1.0.2
pkgrel=3
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
sha256sums=('c4f01275fc56e4ef7a61897fb18f9b09ff3cd8dbc2d475c09d7565b83b8370d3'
            'baff25e9693ad10b482f2e4cc8c1f222f1076d0795cf03f40d595c448d00b56e'
            'f99c0cfcca8f59e962d448c8794836993f2d43013043b8f22827e54a4c3ced8c')
noextract=()
build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo update
  cargo build --release
}

package() {
  cd "$srcdir"

  install -Dm644 bin.service "$pkgdir/usr/lib/systemd/system/bin.service"
  install -Dm644 Rocket.toml "$pkgdir/etc/bin/Rocket.toml"

  install -Dm755 "$pkgname-$pkgver/target/release/bin" "$pkgdir/usr/bin/bin"
}

# vim:set ts=2 sw=2 et:
