# Maintainer: Philipp Hentschel  <aur[at]f1ndus[dot]de>

pkgname=apnotes
pkgver=0.3.6
pkgrel=1
pkgdesc='Interface for Linux to View, Edit, Create and Sync Notes written on apple devices'
url='https://github.com/findus/apnotes'
arch=('x86_64')
license=('MIT')
makedepends=('rust')
depends=('sqlite' 'openssl')
source=(https://github.com/findus/apple-notes-bridge/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('2814ba1888ae9164ac37a05cbae5f0e3d86f49fff217e97de75a2ed71aac45f8')
sha512sums=('57899a1e0d3c426bb0d0ceec10236f287e88a4873ef5f731b2fe37d52f2dc92bdc53672b732557fc019f55f2c21a332d2c9ad00c1397636ff83e5b3293584494')
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
