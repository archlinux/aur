# Maintainer: Maxim Balashov <rsg245@yandex.com>

pkgname=portablemc-bin
pkgver=5.0.2
pkgrel=1
pkgdesc='Cross platform command line utility for launching Minecraft quickly and reliably with included support for Mojang versions and popular mod loaders.'
arch=(x86_64 aarch64 i686)
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
  "${url}/releases/download/v${pkgver}/portablemc-${pkgver}-linux-x86_64-gnu.tar.gz"
	"${url}/releases/download/v${pkgver}/portablemc-${pkgver}-linux-x86_64-gnu.tar.gz.sig")
source_aarch64=(
  "${url}/releases/download/v${pkgver}/portablemc-${pkgver}-linux-aarch64-gnu.tar.gz"
	"${url}/releases/download/v${pkgver}/portablemc-${pkgver}-linux-aarch64-gnu.tar.gz.sig")
source_i686=(
  "${url}/releases/download/v${pkgver}/portablemc-${pkgver}-linux-i686-gnu.tar.gz"
	"${url}/releases/download/v${pkgver}/portablemc-${pkgver}-linux-i686-gnu.tar.gz.sig")

sha256sums_x86_64=(
  'bb1da999faa430b6e4c9fcb214dfa473faf67d560284b99b5cd86b5762ef2c56'
	'5e4bdeda9e8eef71300fbcfffaf0836c3439655570dfdd42c05967f8de45cbdb')
sha256sums_aarch64=(
  '801ef2975724336cc08ea96f1848740af61a9fbd8cad355b3108796967dd522b'
	'ef7e28b63fd5e193224ea5f31523a20760219fc9d220491ec778cb3b446b8a28')
sha256sums_i686=(
  '4386429b69edf8d68a8829b5fa8cd8af551b457fb5e6107b9b2c849f5e148503'
	'5fa8e93c33b6b33500d083612ca0d93cf737a62b49377fce59e57aa4661c4bc0')

package() {
  cd "portablemc-${pkgver}-linux-${CARCH}-gnu"
  
  install -vDm755 -t "${pkgdir}/usr/bin/" portablemc
  install -vDm644 -t "${pkgdir}/usr/share/doc/portablemc/" README
  install -vDm644 -t "${pkgdir}/usr/share/licenses/portablemc/" LICENSE

  install -vdm755 "${pkgdir}/usr/share/man/man1"
  ./portablemc gen man "${pkgdir}/usr/share/man/man1"
}
