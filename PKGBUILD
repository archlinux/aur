# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=1.0.0
pkgrel=1
pkgdesc='multi-backend declarative package manager for Linux'
url='https://github.com/steven-omaha/pacdef'
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
arch=('x86_64')
license=('GPL3')
depends=('pacman')
makedepends=('rust')
sha256sums=('8cbe6fcbecad430e5f7e1b045fcf502db30bd14f000ed8d7770f11ebf0c2272e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --features arch
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/pacdef "${pkgdir}/usr/bin/pacdef"
  install -Dm644 _completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pacdef"
}
