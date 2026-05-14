pkgname=pam-parallel-fprint-git
pkgver=0
pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
