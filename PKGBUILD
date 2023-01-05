# Unofficial package for K40 Whisperer
# Maintainer: Nat Lasseter <aur at 4574 dot co dot uk>

pkgname="k40whisperer"
pkgver="0.62"
pkgrel="1"
pkgdesc="Control software for the stock K40 Laser controller"
arch=("any")
url="https://www.scorchworks.com/K40whisperer/k40whisperer.html"
license=("GPL")

depends=("python" "python-lxml" "python-pyusb" "python-pillow" "python-pyclipper" "tk")
makedepends=("unzip" "dos2unix")

_pkgfile="K40_Whisperer-${pkgver}_src"

source=(
  "https://www.scorchworks.com/K40whisperer/${_pkgfile}.zip"
  "97-ctc-lasercutter.rules"
  "${pkgname}.install"
)
sha256sums=(
  "8b68565dc7af80c172080e0759d3d4fad4b345f858636e861a0c96d0cdc765d6"
  "19b490100927a74a4db8c6332b8a995eb1d1dc24c31467c03e3d8ac62759b508"
  "5d32866a044ce3239881eacd01720b95285031a003a79056644d30e728fcee19"
)

install="${pkgname}.install"

build() {
  cd ${_pkgfile}
  dos2unix k40_whisperer.py
  chmod +x k40_whisperer.py
}

package() {
  mkdir -p ${pkgdir}/usr/lib
  cp -r ${_pkgfile} ${pkgdir}/usr/lib/${pkgname}

  mkdir -p ${pkgdir}/etc/udev/rules.d
  cp 97-ctc-lasercutter.rules ${pkgdir}/etc/udev/rules.d/

  mkdir -p ${pkgdir}/usr/bin
  ln -sf /usr/lib/${pkgname}/k40_whisperer.py ${pkgdir}/usr/bin/${pkgname}
}
