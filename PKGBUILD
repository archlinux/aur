_pkgname=openhfta
pkgname="${_pkgname}-git"
pkgver=r2.5e6e415
pkgrel=1
pkgdesc="HF terrain analysis tool using the OpenYTWCore Fortran numerical engine"
arch=('x86_64')
url="https://github.com/RioDXGroup/openhfta"
license=('0BSD')
depends=(
  'gcc-libs'
  'python'
  'python-matplotlib'
  'python-numpy'
)
makedepends=(
  'gcc-fortran'
  'git'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"
  make
}

check() {
  cd "${_pkgname}"
  make test
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
