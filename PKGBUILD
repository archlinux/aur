# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=1.1.0
pkgrel=1
pkgdesc='multi-backend declarative package manager for Linux'
url='https://github.com/steven-omaha/pacdef'
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
sha256sums=('988ab7f34b7221f7b1a8507698c2e388f256c4baa0681f25a2798318d40b5b8d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --features arch
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/pacdef "${pkgdir}/usr/bin/pacdef"
  install -Dm644 _completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pacdef"
}
