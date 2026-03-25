# Maintainer: yuzujr <15568103056@163.com>

pkgname=ani2xcursor
pkgver=1.4.9
pkgrel=2
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
  'xmake'
  'pkgconf'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('20e37efe917e600a8997b054fe4a8fe24c24ac6e3a98990748307be3d932c5a8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  xmake
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  xmake install -o "${pkgdir}" --prefix=/usr

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
