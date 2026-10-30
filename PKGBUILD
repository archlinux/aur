# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=mosdepth
pkgver=0.3.15
pkgrel=1
pkgdesc='Fast BAM/CRAM depth calculation for WGS, exome, or targeted sequencing'
arch=('x86_64')
url="https://github.com/brentp/${pkgname}"
license=('MIT')
depends=('htslib')
makedepends=('git' 'nim')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7fc4bacd5cd1fecad76c93f08921e32efaad2ebabccd7a65e6f4fdf9095ea08e')

build() {
  cd "${pkgname}-${pkgver}"

  nimble build -y -d:release --passC:-Wno-error=incompatible-pointer-types
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
