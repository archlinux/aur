# Maintainer: Maxim Balashov <rsg245@yandex.com>

pkgname=portablemc-bin
pkgver=5.0.3
pkgrel=1
pkgdesc='Cross platform command line utility for launching Minecraft quickly and reliably with included support for Mojang versions and popular mod loaders.'
arch=(x86_64 aarch64 i686)
url='https://github.com/theorzr/portablemc'
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
  'cc1ca6b0529ac4df552ba794c79c0a40f979b7549124753f0e4446c2b71d81f5'
	'789d0ce60f7ac0d7bd792608b1de3f97590ce0895d5656f286b1b3b074924f37')
sha256sums_aarch64=(
  '12fdfe596bfb89fbf6603b2afb6c505011ad014c11c6643ff59f7cff383ad7a9'
	'33034465d1fe080b378c5f0dd6c29167d3da230524f685984c92205923060ae6')
sha256sums_i686=(
  '0042658df7b37633e481bcd5d7529b9405ab57843bd2e925a6c34404b9a4a12c'
	'611115aef4b8738d2896576b7984b9ea696a6cb8f3ae436d479c32b6e0521bd1')

package() {
  cd "portablemc-${pkgver}-linux-${CARCH}-gnu"
  
  install -vDm755 -t "${pkgdir}/usr/bin/" portablemc
  install -vDm644 -t "${pkgdir}/usr/share/doc/portablemc/" README
  install -vDm644 -t "${pkgdir}/usr/share/licenses/portablemc/" LICENSE

  install -vdm755 "${pkgdir}/usr/share/man/man1"
  ./portablemc gen man "${pkgdir}/usr/share/man/man1"
}
