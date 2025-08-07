# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.24.3
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
source_aarch64=("https://files.digilent.com/Software/Waveforms/${pkgver}/${pkgname}_${pkgver}_arm64.deb")
source_armv6h=("https://files.digilent.com/Software/Waveforms/${pkgver}/${pkgname}_${pkgver}_armhf.deb")
source_armv7h=($source_armv6h)
source_i686=("https://files.digilent.com/Software/Waveforms/${pkgver}/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://files.digilent.com/Software/Waveforms/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_aarch64=('4063f34dac055a8c229a90f33859bc343ce88ae90683c5c592850b7f54e8f0d4')
sha256sums_armv6h=('c426945c0a5d1326ee301a661bf78a4a603109e1f0ed6222ed24018545b6e21d')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('65f2e1dc280b0b2738a15aabb17c3aabf7e537954345991c325df02fbdf25906')
sha256sums_x86_64=('7c25f6f976b6dd47d01f1fa6b1971e948a7019c0e72ee26ae1ae281c5c320497')

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
