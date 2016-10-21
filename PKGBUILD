# Maintainer: yuhr <sdn.pate(at)gmail.com>

pkgname=macrodown-git
pkgver=1.0g.r87.g1e904b1
pkgrel=1
pkgdesc="The translator for Macrodown, a markup language wrapping other markup languages such as TeX/LaTeX or HTML."
url="https://github.com/gfngfn/Macrodown"
license=('MIT')
arch=('i686' 'x86_64')
conflicts=('macrodown')
provides=('macrodown')
makedepends=('git')
depends=('make' 'ocaml')
source=('git+https://github.com/gfngfn/Macrodown.git')
md5sums=(SKIP)

pkgver() {
  cd ${srcdir}/Macrodown
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

package() {
  cd ${srcdir}/Macrodown
  make
  install -dm755 "${pkgdir}"/usr/bin
  install -m644 ./bin/macrodown "${pkgdir}"/usr/bin/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
