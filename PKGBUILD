# Maintainer: wuxxin <wuxxin@gmail.com>

pkgname=coreos-installer
pkgver=0.17.0
pkgrel=1
pkgdesc="Installer for CoreOS disk images"
url="https://github.com/coreos/coreos-installer"
depends=('cargo')
arch=('x86_64')
license=('APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coreos/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a8c7610bebef4acb4a2c4387cd58ecede78828c2da2de16546bea998045e3665')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
