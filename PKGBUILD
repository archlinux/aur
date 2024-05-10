# Maintainer: zilch40 <wlh233@live.com>
pkgname=rime-ls-git
pkgver=0.3.0.r1.g4ae817a
pkgrel=1
pkgdesc='A language server for Rime input method engine - git version'
arch=(x86_64)
url='https://github.com/wlh320/rime-ls'
license=('BSD3')
makedepends=('clang' 'cargo')
depends=('librime')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/rime_ls" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
