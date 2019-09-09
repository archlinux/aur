# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=cake
_gitcommit=a6343388f78bd55f05ff94ee33a0029f9bfb2012

pkgname=crystal-cake
pkgver=1.1.1
pkgrel=1
pkgdesc="Cake is a powerful and flexible Make-like utility tool. Make Tasks Great Again!"
url="https://github.com/axvm/cake"
depends=('crystal')
makedepends=('shards')
arch=('x86_64')
license=('MIT')
source=(
  "git+${url}.git#commit=${_gitcommit}"
)
sha256sums=(
  'SKIP'
)

build() {
  cd "${srcdir}/${_srcname}"
  shards build --release --no-debug
}

package() {
  cd "${srcdir}/${_srcname}"

  # The `cake` command conflicts with `coffeescript` package. So rename it to `crystal-cake`
  install -Dm755 bin/cake "${pkgdir}/usr/bin/crystal-cake"

  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 Cakefile.sample "${pkgdir}/usr/share/doc/${pkgname}/Cakefile.sample"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
