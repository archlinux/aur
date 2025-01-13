# Maintainer: Sierra <sierra at casuallyblue dot dev>
pkgname="mirth-git"
pkgver=0.0.1
pkgrel=1
pkgdesc=" Compiler for the Mirth programming language"
arch=('i686' 'x86_64')
url="https://github.com/mirth-lang/mirth"
license=('BSD0')
groups=()
makedepends=('git' 'gcc' 'make')
conflicts=("mirth")
provides=("mirth")
source=(mirth::git+https://github.com/mirth-lang/mirth.git)
sha256sums=(SKIP)

build() {
  cd "${srcdir}/mirth"

  make build
}

package() {
  cd "${srcdir}/mirth"

  install -Dm755 bin/mirth2 "${pkgdir}/usr/bin/mirth"

  find lib/std -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/lib/mirth/{}" \;
  find lib/arg-parser -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/lib/mirth/{}" \;
}
