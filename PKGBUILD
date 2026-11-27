# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=crossfyre-toolchain-bin
pkgver=0.1.47
pkgrel=1
pkgdesc="Recon and vulnerability scanning engines with live dashboards for finding subdomains, open ports"
arch=('x86_64' 'aarch64')
url="https://github.com/clickswave/crossfyre-toolchain"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip' '!debug' '!emptydirs')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/clickswave/crossfyre-toolchain/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/crossfyre-toolchain-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/crossfyre-toolchain-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('153d5b1a5996146d0aa1594b1418c467220291e00931c3e0383515ad5779c9be')
sha256sums_x86_64=('e5f05d949fc4763ba0715e9efe684f4d0df674470685b9f2fe02bc6552152024')
sha256sums_aarch64=('f68a296c95ad3d550bc0afe6dd01eb15e49fd86e03d9659ded06a97ccc0edbcf')

package() {
  install -d "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
  find . -mindepth 1 -maxdepth 1 ! -type l -exec cp -a {} "${pkgdir}/opt/${pkgname}/" \;
  ln -s "/opt/${pkgname}/crossfyre" "${pkgdir}/usr/bin/crossfyre"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
