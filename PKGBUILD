# Maintainer: yuzujr <15568103056@163.com>

pkgname=ani2xcursor
pkgver=1.4.8
pkgrel=1
pkgdesc="Convert Windows animated cursor themes to Linux Xcursor format"
arch=('x86_64' 'aarch64')
url="https://github.com/yuzujr/ani2xcursor"
license=('MIT')

depends=(
  'glibc'
  'gcc-libs'
  'spdlog'
  'fmt'
  'libxcursor'
  'libx11'
)
makedepends=(
  'gcc'
  'make'
  'pkgconf'
  'gettext'
  'stb'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3a1a624e13c9afb2c3f8436d7d80d3f5c8cee591d98601d533d1586aafe368b1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
