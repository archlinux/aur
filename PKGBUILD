# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=cp210x-dkms
pkgver=2019.7.12
pkgrel=7
conflicts=(cp210x)
provides=("cp210x=$pkgver-$pkgrel")
pkgdesc='Silicon Labs CP210x RS232 serial adaptor driver'
url='https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers'
arch=("any")
license=('GPL')
depends=(dkms)
source=("https://www.silabs.com/documents/login/software/Linux_3.x.x_4.x.x_VCP_Driver_Source.zip"
        override-kversion.patch
        dkms.conf)
sha256sums=('7d624cd66ee610fd9c6598793534ed593ac1309b3d3b3699c101d921ad9ccd7c'
            '4dfcb1fff04a30ccd4b1b6f8d7bba0aada7712aac2b6f3deff792d98f98f651f'
            '62da72a3f8f9566326168a759cb5cc54b8c39aeb6594e1b4229774868c7eb3d2')

prepare() {
  patch Makefile < override-kversion.patch
}

package() {
  install -Dt "$pkgdir/usr/src/cp210x-$pkgver" -m644 Makefile cp210x.c dkms.conf

  echo cp210x | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/cp210x.conf"
}
