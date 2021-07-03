# Maintainer: Philipp Hentschel  <aur[at]f1ndus[dot]de>

pkgname=apnotes
pkgver=0.3.7
pkgrel=1
pkgdesc='Interface for Linux to View, Edit, Create and Sync Notes written on apple devices'
url='https://github.com/findus/apnotes'
arch=('x86_64')
license=('MIT')
makedepends=('rust')
depends=('sqlite' 'openssl')
source=(https://github.com/findus/apple-notes-bridge/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('a9732901aba8536526073a247ad28f2c86e50b869e8cb87fe39d204d1a6c8355')
sha512sums=('06072f8013ac4c71d139b9ccb3df6ca18cd4f7c551bc1f8d1dfe94fa022c901dc0be19409af6ea5c7945a5eaeee33d83cca7346fd4e3c254263901179b38cd6e')
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
