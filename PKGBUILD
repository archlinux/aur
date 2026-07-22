pkgname=fetch-git
_pkgname=fetch
pkgver=2.2.0.r8.g596b548
pkgrel=1
pkgdesc="An animated 3D fetch tool for your terminal"
arch=(x86_64 aarch64)
url="https://github.com/areofyl/fetch"
license=('ISC')
depends=('glibc')
makedepends=('git')
provides=('fetch')
conflicts=('fetch')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long --always | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  make CC=cc CFLAGS="${CFLAGS}"
}

package() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX="${pkgdir}/usr" install
}
