# Maintainer: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=sigdigger-git
pkgver=r930.5097e66
pkgrel=1
pkgdesc="Qt-based digital signal analyzer, using Suscan core and Sigutils DSP library"
arch=(any)
license=('custom')
url="https://github.com/BatchDrake/SigDigger"
depends=('qt6-base' 'sigutils' 'suscan' 'suwidgets')
makedepends=('git' 'gcc')
provides=('sigdigger')
conflicts=('sigdigger')
source=("$pkgname::git+https://github.com/BatchDrake/SigDigger.git#branch=develop")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  qmake6 SigDigger.pro
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  install -Dm755 SigDigger ${pkgdir}/usr/bin/sigdigger
}
