# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=bazelisk
pkgver=1.10.1
pkgrel=1
pkgdesc='A user-friendly launcher for Bazel.'
arch=('x86_64')
license=('Apache')
url='https://github.com/bazelbuild/bazelisk'
makedepends=('git')
conflicts=('bazel')
provides=('bazel')
source=(
  "bazelisk-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "bazelisk-bin-${pkgver}::https://github.com/bazelbuild/bazelisk/releases/download/v${pkgver}/bazelisk-linux-amd64"
)
sha256sums=('eba744ce8fcb6859d6714c6c48b50d0922c7d6e25332c73b00a4cbb06d9c3a68'
            '4cb534c52cdd47a6223d4596d530e7c9c785438ab3b0a49ff347e991c210b2cd')

prepare() {
  chmod +x "${srcdir}/${source[1]%%::*}"
}

build() {
  cd "bazelisk-${pkgver}"
  "${srcdir}/${source[1]%%::*}" build //:bazelisk
  "${srcdir}/${source[1]%%::*}" shutdown
}

package() {
  cd "bazelisk-${pkgver}"

  install -Dm644 \
    "LICENSE" \
    "${pkgdir}/usr/share/licenses/bazelisk/LICENSE"

  install -Dm755 \
    "bazel-bin/bazelisk_/bazelisk" \
    "${pkgdir}/usr/bin/${pkgname%isk}"
}

