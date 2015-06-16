# Author: Ullrich Horlacher <framstag@rus.uni-stuttgart.de>
# Maintainer: Alexander Schmidt <alex@treefish.org>

pkgname=fex-utils-git
pkgver=20150615.r0.ge600969
pkgrel=1
pkgdesc="Utilities for F*EX, a web service to send very large files."
arch=('any')
url="http://fex.belwue.de"
license=('custom:Anti-military Perl Artistic License')
depends=(
  'perl'
  'perl-io-socket-ssl'
)
makedepends=('git' 'ca-certificates-cacert')
source=("$pkgname::git+https://git.treefish.org/fex.git")
sha256sums=('SKIP')
conflicts=('fex-utils')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -Dm755 -t ${pkgdir}/usr/bin \
    ${srcdir}/${pkgname}/bin/afex \
    ${srcdir}/${pkgname}/bin/asex \
    ${srcdir}/${pkgname}/bin/fexsend \
    ${srcdir}/${pkgname}/bin/fexget \
    ${srcdir}/${pkgname}/bin/sexsend \
    ${srcdir}/${pkgname}/bin/sexget \
    ${srcdir}/${pkgname}/bin/sexxx \
    ${srcdir}/${pkgname}/bin/xx \
    ${srcdir}/${pkgname}/bin/zz \
    ${srcdir}/${pkgname}/bin/ezz

  install -Dm755 -t ${pkgdir}/usr/share/${pkgname}/bin \
    ${srcdir}/${pkgname}/bin/fbm

  install -Dm644 ${srcdir}/${pkgname}/doc/Licence \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
