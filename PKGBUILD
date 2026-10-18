# Maintainer: Maxim Balashov <rsg245@yandex.com>

pkgname=portablemc-bin
pkgver=5.0.6
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
  '9b55d0d75b4e5a30d697109869a301009c5927883d34746ce212605e8a61ecad'
  'SKIP')
sha256sums_aarch64=(
  '7be0cd0060d1516b97a6398196a372d5e23f41be2e4a28667c3ddef5b6150c02'
  'SKIP')
sha256sums_i686=(
  'bad83525d0053e819b544adf938508be738bbedd64f87c98a99fd4e4d70b0442'
  'SKIP')

package() {
  cd "portablemc-${pkgver}-linux-${CARCH}-gnu"
  
  install -vDm755 -t "${pkgdir}/usr/bin/" portablemc
  install -vDm644 -t "${pkgdir}/usr/share/doc/portablemc/" README
  install -vDm644 -t "${pkgdir}/usr/share/licenses/portablemc/" LICENSE

  install -vdm755 "${pkgdir}/usr/share/man/man1"
  ./portablemc gen man "${pkgdir}/usr/share/man/man1"
}
