# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openocta-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="OpenOcta is an open-source AIOps Agent installed on Windows & macOS"
arch=('x86_64' 'aarch64')
url="https://github.com/openocta/openocta"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/openocta/openocta/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/openocta_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/openocta_${pkgver}_linux_arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('5d2dce1f7960f995179e32f4e5488601c7bdbe93eeb4acc90e7363df96b9ceba')
sha256sums_aarch64=('f391ab6882b368eda2a744891ff3d669dd53b470a869123ae9ad04652622009b')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="openocta_${pkgver}_linux_amd64" ;;
    aarch64) _dir="openocta_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/openocta" "${pkgdir}/usr/bin/openocta"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
