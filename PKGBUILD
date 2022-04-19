# Maintainer: Philipp Hentschel  <aur[at]f1ndus[dot]de>

pkgname=apnotes
pkgver=0.4.0
pkgrel=1
pkgdesc='Interface for Linux to View, Edit, Create and Sync Notes written on apple devices'
url='https://github.com/findus/apnotes'
arch=('x86_64')
license=('MIT')
makedepends=('rust' 'scdoc')
depends=('sqlite' 'openssl' 'dbus')
source=(https://github.com/findus/apple-notes-bridge/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('8e2114ac5fa68b97348b6384b7297ed8d4913cc0936a153ca0a7c967abc981ac')
sha512sums=('b355e7943d1e65d86e567bbf356ae09d3e35f090cb0f0f443b86bef1514011df61eaadbbf006f6ae783202c768ead437a6a2d12f43af56e55a9b668e995e1231')
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
