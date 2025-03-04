# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Ratakor <ratakor@disroot.org>

pkgname=poop
pkgver=0.5.0
pkgrel=1
pkgdesc="Performance Optimizer Observation Platform"
arch=('aarch64' 'i686' 'riscv64' 'x86_64')
url="https://github.com/andrewrk/${pkgname}"
license=('MIT')
makedepends=('zig')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b67d62c3583994fb262ccaf05094b215d3514d4d2935a25a3867dcab0cf89c93')

build() {
  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --verbose \
    -Dtarget=native-linux.6.1-gnu.2.39 \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -va build/* "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
