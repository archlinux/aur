# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=gyro
pkgver=0.5.0
pkgrel=1
pkgdesc="An unofficial package manager for the Zig programming language"
url="https://github.com/mattnite/gyro"
license=('MIT')
makedepends=('git' 'zig')
arch=('x86_64')
source=(
  #"git+${url}.git#tag=${pkgver}"
  "git+${url}.git#commit=b3aa10462ccf073701023d74221e388d33b70820"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${pkgname}"

  git submodule update --init --recursive

  zig build test
}

build() {
  cd "${srcdir}/${pkgname}"
  zig build -Drelease-safe=true
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D -m755 zig-out/bin/gyro "${pkgdir}/usr/bin/gyro"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 img/logo.gif "${pkgdir}/usr/share/doc/${pkgname}/img/logo.gif"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644 completions/_gyro "${pkgdir}/usr/share/zsh/site-functions/_gyro"
}
