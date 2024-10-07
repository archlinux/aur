# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.23.4
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
source_aarch64=("https://files.digilent.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_arm64.deb")
source_armv6h=("https://files.digilent.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_armhf.deb")
source_armv7h=($source_armv6h)
source_i686=("https://files.digilent.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://files.digilent.com/Software/Waveforms2015/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_aarch64=('aca27e3390e3f099453428d64d99730b1a23bc37ef79bebadb360b0201a21907')
sha256sums_armv6h=('6201b6fff9a6416d401fdca55abc5f05adeedf98aabbea9d233b2893e5f1176e')
sha256sums_armv7h=($sha256sums_armv6h)
sha256sums_i686=('d9d8c27801264db2a48404a18c56255d4954b479ff028e40e11e768f9404b6fb')
sha256sums_x86_64=('a89b19400a32d20aad823c1b5fc999ba72239c751d445a219dc39088404e6759')

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
