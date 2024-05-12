# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.22.2
pkgrel=1
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
sha256sums_aarch64=('515265231bd1324b995665c843d747f41ae939f5b2d450844246392450729e18')
sha256sums_armv6h=('aa6b88f0d254165e81346c8cb893fdba8381156d6a42e93442679441b8fbb512')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('84d271b4bec868c77ae15eb74d6d3d8df4f397862cc7b35ce520d3f79f212259')
sha256sums_x86_64=('4251544b6aa81e77cba68a032b034721900f600441712d5a87668103e5289155')

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
