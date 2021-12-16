# Maintainer: Alex Reinking alex_reinking@berkeley.edu
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kyle Keen <keenerd@gmail.com>
_base=halide
pkgname=${_base}-bin
pkgver=13.0.2
pkgrel=1
_noise="cf8c8f22eb507aedeba5a44f8ee20bc63757dc57"
pkgdesc="A language for fast and portable data-parallel computation"
url="https://github.com/${_base}/${_base/h/H}"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=(MIT)
conflicts=("${pkgname/-bin/}")
provides=("${pkgname/-bin/}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_base/h/H}-${pkgver}-x86-64-linux-${_noise}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_base/h/H}-${pkgver}-x86-32-linux-${_noise}.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_base/h/H}-${pkgver}-arm-32-linux-${_noise}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_base/h/H}-${pkgver}-arm-64-linux-${_noise}.tar.gz")

sha512sums_x86_64=('bf16291f8ebd225e3641210b1e4402c5e6a706fe461b596a7604657c4f581ed6ac94fe6bc240bdeb9aa19ee0ad375330f019fb235f41bde0942a3d31d41bbfd2')
sha512sums_i686=('8460bd3ffade9ee91378cfc373d8b35d2650e97f7719f22aa2cefee20ccea1bd8b5fe60d0d7e6e0722a173fbb5d57627a703209b1bf5b381fd3ca26d15031b68')
sha512sums_armv7h=('8a57dea1c2f8bdad087116fa59fe2356c79355a00338079f48af1c869a4683f27d6325fda85aa0352057dd7ab49fff0821fbf99162ba49aeca55273650dbb954')
sha512sums_aarch64=('ebb370b4cb578620668cb3851e5d515e91e19d854b51a99913ebe3ec7bd85e099d1a4f962422fbb70693283d795ab9f8e8725272ed7181c75912a333474a46b4')

if [[ "$CARCH" == "x86_64" ]]; then _tar_arch='x86-64'; fi
if [[ "$CARCH" == "i686" ]]; then _tar_arch='x86-32'; fi
if [[ "$CARCH" == "armv7h" ]]; then _tar_arch='arm-32'; fi
if [[ "$CARCH" == "aarch64" ]]; then _tar_arch='arm-64'; fi

package() {
  cd "${_base/h/H}-${pkgver}-${_tar_arch}-linux"

  for i in bin/*; do
    install -Dvm755 "${i}" -t "${pkgdir}/usr/bin"
  done

  for i in lib/lib*; do
    install -Dvm755 "${i}" -t "${pkgdir}/usr/lib"
  done

  for i in include/*.h; do
    install -Dvm644 "${i}" -t "${pkgdir}/usr/include"
  done
}
