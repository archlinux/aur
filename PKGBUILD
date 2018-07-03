# Maintainer:  swalladge <samuel at swalladge dot id dot au>

pkgname=pscircle-git
_pkgname=pscircle
pkgver=1.0.0.8.gdd7431a
pkgrel=1
pkgdesc="pscircle visualizes Linux processes in a form of radial tree"
arch=('i686' 'x86_64')
url="https://gitlab.com/mildlyparallel/pscircle"
license=('GPL2')
depends=('cairo')
makedepends=('git' 'meson' 'cairo' 'libpng' 'libx11')
provides=('pscircle')
conflicts=('pscircle')
source=("$pkgname"::'git+https://gitlab.com/mildlyparallel/pscircle.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//' | sed 's/-/./g'
}

build() {
  cd "$pkgname"
  mkdir -p build
  cd build
  meson ..
  ninja
}

package() {
  cd "$pkgname"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  # install -Dm644 "examples/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}
