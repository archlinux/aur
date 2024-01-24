# Maintainer: wuxxin <wuxxin@gmail.com>

pkgname=coreos-installer
pkgver=0.20.0
pkgrel=1
pkgdesc="Installer for CoreOS disk images"
url="https://github.com/coreos/coreos-installer"
depends=('cargo')
arch=('x86_64')
license=('APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coreos/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('386928324d0fcd92c2d2d7ea79ccb0e354938cb656fc2ace08aab3075bfaf84a')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
