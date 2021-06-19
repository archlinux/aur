# Maintainer: Philipp Hentschel  <aur[at]f1ndus[dot]de>

pkgname=apnotes
pkgver=0.3.5
pkgrel=1
pkgdesc='Interface for Linux to View, Edit, Create, Backup and Sync Notes from apple devices'
url='https://github.com/findus/apple-notes-bridge'
arch=('x86_64')
license=('MIT')
makedepends=('rust')
depends=('sqlite' 'openssl')
source=(https://github.com/findus/apple-notes-bridge/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('bd288d410882de5f7829b43d4067e6b94a0aa6f07c0994860ba55674602712d0')
sha512sums=('2527f7d3b08e88653b634e8351797a81d0600cd5a3b1d3621bdd48f8106f3419e7af881294407337af4abcf91408dfae784983383758cd8c04216f287e8f3e31')
validpgpkeys=('01938725ABC3812F5DBC219C6E19B9E46E818A5F')


build() {
  cd ${pkgname}-${pkgver}
  SHELL_COMPLETIONS_DIR=completions cargo build --release --locked
}

check() {
  cd ${pkgname}-${pkgver}
  cargo test --release --locked -- --test-threads=1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm 755 target/release/apnotes-tui -t "${pkgdir}/usr/bin"
  install -Dm 755 target/release/apnotes -t "${pkgdir}/usr/bin"
}
