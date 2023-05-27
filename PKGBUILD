# Maintainer: myon <myon@myon98.net>
pkgname=opuscomment
pkgver=1.5.12
pkgrel=1
pkgdesc='Ogg Opus tag and output gain editor'
arch=('x86_64')
url='https://github.com/hcmiya/opuscomment'
license=('MIT')
depends=('glibc' 'libogg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hcmiya/opuscomment/archive/refs/tags/v${pkgver}.tar.gz"
    '000-link-fix.patch')
sha256sums=('83a6d7b7d4b1d098181ae60a75dac3ed32a24be731540114a2c00680c1c8ab7e' 'SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/000-link-fix.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  CFLAGS='-O2' ./build.sh release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -D src/opuscomment "${pkgdir}/usr/bin/opuscomment"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

