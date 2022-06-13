# Maintainer: Philipp Hentschel  <aur[at]f1ndus[dot]de>

pkgname=apnotes
pkgver=0.4.2
pkgrel=0
pkgdesc='Interface for Linux to View, Edit, Create and Sync Notes written on apple devices'
url='https://github.com/findus/apnotes'
arch=('x86_64')
license=('MIT')
makedepends=('rust' 'scdoc')
depends=('sqlite' 'openssl' 'dbus')
source=(https://github.com/findus/apple-notes-bridge/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('cadaf44f83154a82d147189575e3275e64490fc7b13a22ba8a51202f73bbdd5e')
sha512sums=('1f4ae624cb5490db3cb112dd15c16956ca48a6b714d9f3aae0c27eef0b2bc4c9b4adc44e6fca71f00ea1d7e614881556a73c0d32255a3fee4418ebb81b962b46')
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
