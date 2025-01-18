# Maintainer Tait Hoyem <tait+odilia_aur@tait.tech>

pkgname=odilia-git
pkgver=0.2
pkgrel=1
pkgdesc="Main branch of Odilia."
url="https://odilia.app/"
license=('GPL3')
arch=('x86_64' 'aarch64')
depends=(
  clang # required by speech-dispatcher-dev
  speech-dispatcher # required by above, as well as -rs crate
  cargo # for compiling odilia
  at-spi2-core # for interaction of Odilia with the atspi service
  at-spi2-atk # for interaction of Odilia with GTK applications
)
provides=( odilia )

source=(
  $pkgname-$pkgver::git+https://github.com/odilia-app/odilia.git
)
sha256sums=(
  'SKIP'
)

prepare() {
	ls
  cd "$pkgname-$pkgver"
  cargo fetch
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/odilia"
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm644 -t "$pkgdir/etc/odilia" "odilia/config.toml"
}

#vim: syntax=sh

