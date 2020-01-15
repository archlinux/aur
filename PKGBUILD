# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=cargo-web-git
pkgver=0.6.26.452.g2ddd9bb
pkgrel=1
pkgdesc="A Cargo subcommand for the client-side Web"
url="https://github.com/koute/cargo-web"
depends=('cargo' 'openssl')
optdepends=('chromium: needed for tests')
provides=('cargo-web')
conflicts=('cargo-web')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'APACHE')
source=("${pkgname}::git+https://github.com/koute/cargo-web")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  echo $(grep '^version =' Cargo.toml |head -n1 |cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
  cd "${pkgname}"
  cargo build --release --locked
}

check() {
  cd "${pkgname}"
  cargo test --release --locked
}

package() {
  cd "${pkgname}"
  install -Dm755 target/release/cargo-web -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
