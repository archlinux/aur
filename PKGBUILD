# Maintainer: Sergej "winnie" Schmidt <sergej@hex.house>

_py="python"
_eggname="pylstar"
pkgname=${_py}-${_eggname}
pkgver=r37.2e01929
pkgrel=1
pkgdesc="pylstar is a free and open source Python implementation of the LSTAR Grammatical inference algorithm. At the moment egg is pulled from git. This is temporary, will be packaged as realease soon."
arch=('any')
url="https://github.com/gbossert/pylstar"
license=('GPL3')
depends=("${_py}")
makedepends=("${_py}-setuptools")
options=(!emptydirs)
source=(${pkgname%-git}::git+https://github.com/gbossert/pylstar.git#branch=next)
provides=('python-bintrees')
sha256sums=('SKIP')
pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "${srcdir}/${pkgname}"
  ${_py} setup.py install --root="$pkgdir" || return 1
  install -Dpm644 "COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  msg "Install successful."
}
