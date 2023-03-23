# Maintainer Tait Hoyem <tait+odilia_aur@tait.tech>

pkgname=odilia
pkgver=0.1.4
pkgrel=1
pkgdesc="Building a better screen reader for the Linux desktop, one step at a time. "
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
  odilia-$pkgver.tar.gz::https://github.com/odilia-app/odilia/archive/refs/tags/v$pkgver.tar.gz
)
sha256sums=(
  4a35c7c949e8da919403d3e8a095ca44036e222af9d8d9ebcf5b28bb586f298e
)

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm644 -t "$pkgdir/etc/$pkgname" "odilia/config.toml"
}

#vim: syntax=sh

