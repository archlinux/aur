# Maintainer: Julien Desgats <arch@mille337.net>

pkgname=liblolhtml-git
_pkgname=liblolhtml
_dir=lol-html/c-api
pkgver=380.8d3c21b
pkgrel=1
pkgdesc='Low output latency streaming HTML parser/rewriter with CSS selector-based API'
arch=('x86_64')
url=https://crates.io/crates/lol-html
license=('BSD')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('gcc-libs')
makedepends=('rust' 'git')
source=("git+https://github.com/cloudflare/lol-html.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_dir}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_dir}"
  cargo build --release --locked
}

# Broken as of 380.8d3c21b (2019-11-29)
#check() {
#  cd "${srcdir}/${_dir}"
#  cargo test --release --locked
#}

package() {
  cd "${srcdir}/${_dir}"
  install -Dm 755 target/release/liblolhtml.so -t "${pkgdir}/usr/lib"
  install -Dm 644 include/lol_html.h -t "${pkgdir}/usr/include"
  install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
