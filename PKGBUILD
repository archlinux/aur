# Maintainer: Maxim Balashov <rsg245@yandex.com>

pkgname=portablemc-bin
pkgver=5.0.4
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
  'b14d2dff5191dabf90414562820ffdddfb5ee1acf692729782b4691d55b7b4f8'
	'c8a27a8ca47edf36b7e82a7662fd70d775014ec56c5a64b84e4707b214ce7271')
sha256sums_aarch64=(
  '7126f34261e2732ece3210f6dbd3b4fc502fb1887fc12e66da345ad5d67ad240'
	'619ab8fc67b026ca9efe240d92e244aec8f8e0fb56fb3d7dd5caa24890802926')
sha256sums_i686=(
  '71064fb0e5fea22ca642b00c6bdb51311836af87f8ffab3ec99cb4b3edaddc81'
	'48e91a1e3d8659ea4d9574324c483be4253ec7157f2269897d00e1c2bf723081')

package() {
  cd "portablemc-${pkgver}-linux-${CARCH}-gnu"
  
  install -vDm755 -t "${pkgdir}/usr/bin/" portablemc
  install -vDm644 -t "${pkgdir}/usr/share/doc/portablemc/" README
  install -vDm644 -t "${pkgdir}/usr/share/licenses/portablemc/" LICENSE

  install -vdm755 "${pkgdir}/usr/share/man/man1"
  ./portablemc gen man "${pkgdir}/usr/share/man/man1"
}
