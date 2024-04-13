# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=1.6.0
pkgrel=1
pkgdesc='multi-backend declarative package manager for Linux'
url='https://github.com/steven-omaha/pacdef'
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
sha256sums=('911bd739b1b2747148e5db12e70dac5076b25e86d4e8848b7e5abdc7f30093eb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --features arch
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/pacdef "${pkgdir}/usr/bin/pacdef"
  install -Dm644 _completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pacdef"

  install -Dm644 man/pacdef.8 "${pkgdir}/usr/share/man/man8/pacdef.8"
  install -Dm644 man/pacdef.yaml.5 "${pkgdir}/usr/share/man/man5/pacdef.yaml.5"
}
