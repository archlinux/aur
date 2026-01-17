# Maintainer: Maxim Balashov <rsg245@yandex.com>

pkgname=portablemc-bin
pkgver=5.0.1
pkgrel=3
pkgdesc='Cross platform command line utility for launching Minecraft quickly and reliably with included support for Mojang versions and popular mod loaders.'
arch=(x86_64 aarch64)
url='https://github.com/mindstorm38/portablemc'
license=('Apache-2.0')
depends=(
  gcc-libs
  glibc
  openssl
)

provides=('portablemc')
conflicts=('portablemc')

validpgpkeys=('F659B0F0B84A26CAC635D72948CAEE8DC3456B2F')

source_x86_64=(
  "${url}/releases/download/v${pkgver}/portablemc-${pkgver}-linux-x86_64.tar.gz"
	"${url}/releases/download/v${pkgver}/portablemc-${pkgver}-linux-x86_64.tar.gz.sig")
source_aarch64=(
  "${url}/releases/download/v${pkgver}/portablemc-${pkgver}-linux-aarch64.tar.gz"
	"${url}/releases/download/v${pkgver}/portablemc-${pkgver}-linux-aarch64.tar.gz.sig"
)

sha256sums_x86_64=(
  '828e7537df32b1a8aeb670f5ded91af5e54f618921fb93957006c59fe7f5f569'
	'bbc1cd9d525d0b41b68ea3124498411a79dfecc3a9ad47f2c28d04a8f3554556')
sha256sums_aarch64=(
  'bde62cf800a9e7f27698a4ea4b70c729a950314b8bbf2e9c49379b39d3aab8de'
	'35f8e7043abc500aa1f637602f5885a46954df917daa11f50529e699741775da')

package() {
  cd "portablemc-${pkgver}-linux-${CARCH}"
  install -dm 755 "${pkgdir}/usr/bin"
  install -dm 755 "${pkgdir}/usr/share/man/man1"
  install -Dm755 portablemc "${pkgdir}/usr/bin/portablemc"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  "${pkgdir}/usr/bin/portablemc" gen man "${pkgdir}/usr/share/man/man1"
}
