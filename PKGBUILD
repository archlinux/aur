# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.21.3
pkgrel=5
pkgdesc="Digilent WaveForms Application, Runtime and SDK"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://digilent.com/reference/software/waveforms/waveforms-3/start"
license=('custom')
depends=('digilent.adept.runtime' 'hicolor-icon-theme' 'qt5-multimedia' 'qt5-script' 'qt5-serialport')
optdepends=('python: Python example scripts'
            'python-matplotlib: Python example scripts'
            'python-numpy: Python example scripts'
            'python-requests: Python example scripts'
            'python-scipy: Python example scripts')
options=('!strip')
install=${pkgname}.install
source_aarch64=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_arm64.deb")
source_armv6h=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_armhf.deb")
source_armv7h=($source_armv6h)
source_i686=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://digilent.s3.amazonaws.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_aarch64=('efb303f69d1efe707c6af8d3656380e85fcef5ce0624d5cb2bd48f1dc82f0713')
sha256sums_armv6h=('e46d0f3cbed485090fa46ddc1eed6d637a5232ff66dffdc713859d1fbf2e1df5')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('64be424aa8e04039796a9633513ba7a7ad2fe0e1315bc03058d60a19617dcfcd')
sha256sums_x86_64=('5ec37e051cf15b28572ac141f66a1a4ce6a4971c42d5c37cbba58cfd5d30d7ea')

package() {
  # Extract
  tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"

  # Install icons
  for _size in 32 256; do
    for _mimetype in application-x-dwf3project application-x-dwf3work; do
      install -Dm 644 "${pkgdir}/usr/share/digilent/waveforms/pixmaps/${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/mimetypes/${_mimetype}.png"
    done
  done
}
