# Maintainer: Philipp Hentschel  <aur[at]f1ndus[dot]de>

pkgname=apnotes
pkgver=0.4.3
pkgrel=0
pkgdesc='Interface for Linux to View, Edit, Create and Sync Notes written on apple devices'
url='https://github.com/findus/apnotes'
arch=('x86_64')
license=('MIT')
makedepends=('rust' 'scdoc')
depends=('sqlite' 'openssl' 'dbus')
source=(https://github.com/findus/apple-notes-bridge/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('5adf009d3ae401946c9079d22656d9edc3b389b8849854fcfc02e24183d0d405')
sha512sums=('687c718df20b0f5d792858331c50e83d89f614dea26788f966447f4aafa444e9c5ebdcfb3b09294c0c3e4c90e0d86165bad8d0c50619d3a40b4691683653b405')
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
  echo $(pwd)
  install -Dm755 target/release/apnotes-tui -t "${pkgdir}/usr/bin"
  install -Dm755 target/release/apnotes -t "${pkgdir}/usr/bin"
  install -Dm644 target/release/apnotes.1.gz -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 target/release/apnotes.5.gz -t "${pkgdir}/usr/share/man/man5"
  install -Dm644 target/release/apnotes-tui.1.gz -t "${pkgdir}/usr/share/man/man1"
}
