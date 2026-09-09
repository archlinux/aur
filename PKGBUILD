# Maintainer: Maxim Balashov <rsg245@yandex.com>

pkgname=portablemc-bin
pkgver=5.0.5
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
  '272611ab554237993cd2720dcc7219516f5e9d6382986df2c6d7177793b145dc'
  'SKIP')
sha256sums_aarch64=(
  '6988f57144b1460c77fbbd7b26d66d86dc3091d690f570b06847275b69d1a876'
  'SKIP')
sha256sums_i686=(
  '1ee287184f5ee92bbdafb784755a837066067c481d54f86cc80352d101e2e5eb'
  'SKIP')

package() {
  cd "portablemc-${pkgver}-linux-${CARCH}-gnu"
  
  install -vDm755 -t "${pkgdir}/usr/bin/" portablemc
  install -vDm644 -t "${pkgdir}/usr/share/doc/portablemc/" README
  install -vDm644 -t "${pkgdir}/usr/share/licenses/portablemc/" LICENSE

  install -vdm755 "${pkgdir}/usr/share/man/man1"
  ./portablemc gen man "${pkgdir}/usr/share/man/man1"
}
