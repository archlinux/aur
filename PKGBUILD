# Maintainer: CreamSodass <greatvaluecreamsoda@gmail.com>

_plug=ffvship
pkgname=${_plug}-cuda-git
pkgrel=1
pkgver=3.0.0.13.g1ed2fb3
pkgdesc="Cli tool for computing the metric difference between two videos (GIT version)"
arch=('x86_64')
url='https://github.com/Line-fr/Vship'
license=('MIT')
depends=('cuda' 'ffms2')
makedepends=('git' 'make')
provides=("${_plug}")
conflicts=("${_plug}")
source=("${_plug}::git+https://github.com/Line-fr/Vship.git")
sha256sums=('SKIP')

build() {
  cd "${_plug}"

  export PATH="/opt/cuda/bin:$PATH"

  make buildFFVSHIPcudaall
}

pkgver() {
  cd "${srcdir}/${_plug}"
  # Generate pkgver like: v3.0.0.0.g7cd1d4f
  git describe --tags --long | sed 's/^v//;s/-/./g'
}

package(){
  cd "${_plug}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
