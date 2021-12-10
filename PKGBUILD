# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=bazelisk
pkgver=1.11.0
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
sha256sums=('5bb97aa5c8976876afa52807d0de9df9c524397a420248fb2353c193549cd3e3'
            '231ec5ca8115e94c75a1f4fbada1a062b48822ca04f21f26e4cb1cd8973cd458')

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

