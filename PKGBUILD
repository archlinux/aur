# Maintainer: Philipp Hentschel  <aur[at]f1ndus[dot]de>

pkgname=apnotes
pkgver=0.3.8
pkgrel=1
pkgdesc='Interface for Linux to View, Edit, Create and Sync Notes written on apple devices'
url='https://github.com/findus/apnotes'
arch=('x86_64')
license=('MIT')
makedepends=('rust')
depends=('sqlite' 'openssl' 'dbus')
source=(https://github.com/findus/apple-notes-bridge/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('1e0151a8ec7e70f29e56b26ad6b17638919cb895583141a08db036b7039c54b2')
sha512sums=('a603c54183c2a0ab5b38a4ed3115aad3cb7aefe8b6be92957a3a7fdd04873c6a288767a88a13c3b01dfc0a66773e0fd9985ff4d8c5727f1e6430cc69ee9033a6')
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
}
