# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=digilent.waveforms
pkgver=3.25.1
pkgrel=1
pkgdesc="Digilent WaveForms Application, Runtime and SDK"
arch=('x86_64' 'aarch64')
url="https://digilent.com/reference/software/waveforms/waveforms-3/start"
license=('custom')
depends=('digilent.adept.runtime' 'hicolor-icon-theme' 'qt6-multimedia' 'qt6-declarative' 'qt6-5compat' 'qt6-serialport')
optdepends=('python: Python example scripts'
            'python-matplotlib: Python example scripts'
            'python-numpy: Python example scripts'
            'python-requests: Python example scripts'
            'python-scipy: Python example scripts')
options=('!strip')
install=${pkgname}.install
source_aarch64=("https://files.digilent.com/Software/Waveforms/${pkgver}/${pkgname}_${pkgver}_arm64.deb")
source_x86_64=("https://files.digilent.com/Software/Waveforms/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_aarch64=('14ffc4503f739e87a957ef363f994f544e49b77decc4e3ef4bbcac3832c80345')
sha256sums_x86_64=('d2979aab726c9202a48a1c5d2b314531513171c0b62fa2f2a2edcd29202727d3')

package() {
  # Extract
  tar -xf data.tar.* --exclude="usr/share/lintian" -C "${pkgdir}"/

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
