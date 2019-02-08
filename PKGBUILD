# Maintainer: Harenome Ranaivoarivony-Razanajato <ranaivoarivony-razanajato@hareno.me>

pkgname=aftermath-openmp-git
pkgver=r366.3416578
pkgrel=1
pkgdesc="Openmp tracing tool for Aftermath"
arch=(x86_64)
url="https://aftermath-tracing.com/"
license=('BSD')
depends=("aftermath" "papi" "llvm" "clang")
provides=("aftermath-openmp")
source=(
  ${pkgname}::git://git.drebesium.org/aftermath-openmp.git#branch=staging
)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # The repository has no tag. There is no reference to a version number
  # in the source code.
  # We use the number of commits and the commit hash as a version number.
  printf "r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}
