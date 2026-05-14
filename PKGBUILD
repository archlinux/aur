# Maintainer: Selim Cifci <cifciselimhasan@gmail.com>
pkgname=pam-parallel-fprint
pkgver=r18.d324d2d
pkgver() {
  cd "$srcdir/PAM-Parallel-Fprint"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
pkgrel=1
pkgdesc="PAM module allowing for fprintd and password authentication in parallel"
arch=('x86_64')
url="https://github.com/SelimCifci/PAM-Parallel-Fprint"
license=('GPL3')
depends=('pam' 'fprintd')
makedepends=('git' 'cmake')
source=("git+https://github.com/SelimCifci/PAM-Parallel-Fprint.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/PAM-Parallel-Fprint"
  cmake -S . -B build
  cmake --build build
}

package() {
  mkdir -p "${pkgdir}/usr/lib/security/"
  cp "${srcdir}/PAM-Parallel-Fprint/build/pam_parallel_fprint.so" "${pkgdir}/usr/lib/security/"
}
