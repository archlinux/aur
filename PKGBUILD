# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=dektec-avfifo-examples
pkgver=2023.2
pkgrel=8
_sdkver=2024.09.0
pkgdesc='AvFifoExamples - DekTec AvFifo (SMPTE 2110) Code Examples for Linux'
arch=('x86_64')
url="https://www.dektec.com/downloads/SDK/#linux"
license=('LicenseRef-custom')
depends=('gcc-libs' 'glibc' 'dektec-drivers-dkms' 'sdl2')
source=("https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdkver}.tar.gz"
        "https://www.dektec.com/products/SDK/AvFifoExamples/downloads/avfifo_examples.tar.gz")
sha256sums=('da4763b3174cfa2e4817bb52818d72e5941ba0a6a083cb2be4714aa8bd520623'
            '378109bd8548ff6d210f78efd24057022c5fb1e96e74a570b62fab7941c1c8bb')

prepare() {
  # Include DTAPI (SDK) for AvFifo
  cp LinuxSDK/DTAPI/Include/DTAPI.h avfifo_examples/Common/DTAPI/include
  cp LinuxSDK/DTAPI/Include/DTAPI_AvFifo.h avfifo_examples/Common/DTAPI/include
  cp -r LinuxSDK/DTAPI/Lib/GCC7.5.0/* avfifo_examples/Common/DTAPI/lib/GCC8
}

build() {
  # Compile AvFifoRx
  cd "${srcdir}/avfifo_examples/AvFifo_VideoRx"
  make
  # Compile AvFifoTx
  cd "${srcdir}/avfifo_examples/AvFifo_VideoTx"
  make
}

package() {
  install -Dm755 "${srcdir}/avfifo_examples/AvFifo_VideoRx/AvFifo_VideoRx" "${pkgdir}/usr/bin/AvFifo_VideoRx"
  install -Dm755 "${srcdir}/avfifo_examples/AvFifo_VideoTx/AvFifo_VideoTx" "${pkgdir}/usr/bin/AvFifo_VideoTx"
  install -Dm644 "${srcdir}/LinuxSDK/License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
