# Maintainer: Jesco Topp <jesco.topp@gmail.com>
# Maintainer: Adam Mlady <adam.mlady@elevated.ovh>

_pkgname="starnet2"
pkgname="${_pkgname}-bin"
pkgdesc="StarNet2 is the 2nd iteration of a neural network to remove stars from (nonlinear) astronomical images."
pkgver=2.6.2
pkgrel=1

arch=("x86_64")
url="https://starnetastro.com/cli-tools/starnet/"
license=('custom')
provides=('starnet2')
conflicts=('starnet2')
depends=('libcurl-gnutls')

source=("https://download.starnetastro.com/starnet2_linux_${pkgver}-0241_ORT_x64_cli.zip")
sha256sums=('185c72e032eef6ed963ffc73e88767449c1bd6a6ea850b91ed1b757bfd11beef')

package() {
  _srcdir="${srcdir}/starnet2_linux_${pkgver}-0241_ORT_x64_cli"

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
