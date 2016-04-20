# Contributor: epitron <chris at ill-logic dot com>
# Category: 

pkgname=rowhammer-native-git
pkgver=r21.dc2ae5b
pkgrel=1
pkgdesc='Platform-specific rowhammer tests (Ivy Bridge, Sandy Bridge, Haswell, Skylake) from the rowhammerjs project'
url='https://github.com/IAIK/rowhammerjs/tree/master/native'
license=('Apache')
arch=('i686' 'x86_64')
source=('git+https://github.com/IAIK/rowhammerjs.git')
sha256sums=('SKIP')
_reponame=rowhammerjs
_bins="rowhammer rowhammer-ivy rowhammer-sandy rowhammer-haswell rowhammer-skylake"

pkgver() {
  cd "${_reponame}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_reponame}/native"
  make ${_bins}
}

package() {
  cd "${srcdir}/${_reponame}/native"

  install -Dm755 -t ${pkgdir}/usr/bin ${_bins}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
