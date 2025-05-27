# Maintainer: Tianhao Wang <i AT shrik3 DOT com>

pkgname=hammer-git
# the repo and binary names use abbr.
_pkgname=ham
pkgver=0.0.r299.51d5e1b
pkgrel=1
pkgdesc="Hammer (ham) is a tool to manage big projects consisting of multiple loosely coupled git repos"
arch=('any')
url="https://github.com/kernkonzept/ham"
depends=(
    'perl'
    'perl-xml-parser'
    'perl-uri'
    'perl-git-repository'
)
makedepends=('git')
license=('BSD-2-Clause')
source=('git+https://github.com/kernkonzept/ham')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${_pkgname}
  # EXECUTABLE
  install -Dm755 "ham" "${pkgdir}/usr/bin/vendor_perl/ham"
  # LIBRARY
  cd Hammer && find . -type f -exec install  -Dm 755 "{}" "${pkgdir}/usr/share/perl5/vendor_perl/Hammer/{}" \;
  # LICENSE
  install -Dm644 "${srcdir}/${_pkgname}"/LICENSE.spdx "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.spdx"
}
