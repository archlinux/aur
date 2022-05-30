# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=gyro
pkgver=0.7.0
pkgrel=1
pkgdesc="An unofficial package manager for the Zig programming language"
url="https://github.com/mattnite/gyro"
license=('MIT')
makedepends=('git' 'zig')
arch=('x86_64')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=(
  '349b6d4e7dcd6e9696b7a4fe06ac18517012af3b703e9bb247554475b2c0789e'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  zig build test
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  zig build -Drelease-safe
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 zig-out/bin/gyro "${pkgdir}/usr/bin/gyro"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 img/logo.gif "${pkgdir}/usr/share/doc/${pkgname}/img/logo.gif"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644 completions/_gyro "${pkgdir}/usr/share/zsh/site-functions/_gyro"
}
