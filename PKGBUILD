# Maintainer: Jesco Topp <jesco.topp@gmail.com>
# Maintainer: Adam Mlady <adam.mlady@elevated.ovh>

_pkgname="starnet2"
pkgname="${_pkgname}-bin"
pkgdesc="StarNet2 is the 2nd iteration of a neural network to remove stars from (nonlinear) astronomical images."
pkgver=2.5.3
pkgrel=1

arch=("x86_64")
url="https://starnetastro.com/cli-tools/starnet/"
license=('custom')
provides=('starnet2')
conflicts=('starnet2')

source=("https://download.starnetastro.com/starnet2_linux_2.5.3-0208_ORT_x64_cli.zip")
sha256sums=('101c724a50328cbeb1b3aedb74e18a81894100b3cf668de6b5006d0a46c29d99')

package() {
  _srcdir="${srcdir}/starnet2_linux_${pkgver}-0208_ORT_x64_cli"

  # Install Licenses
  install -Dm644 "${_srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/STARNET2_LICENSE.txt"
  install -Dm644 "${_srcdir}/lib/"*.txt -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
  install -Dm644 "${_srcdir}/lib/opencv-licenses/"* -t "${pkgdir}/usr/share/licenses/${_pkgname}/opencv-licenses/"

  # Install Readme
  install -Dm644 "${_srcdir}/README.txt" -t "${pkgdir}/usr/share/doc/${_pkgname}/"

  # Install Application
  install -Dm755 "${_srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_srcdir}/StarNet2_weights.onnx" -t "${pkgdir}/usr/lib/${_pkgname}/"
  install -Dm644 "${_srcdir}/lib/"*.so* -t "${pkgdir}/usr/lib/${_pkgname}/"
}
