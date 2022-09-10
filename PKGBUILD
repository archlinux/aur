# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=bazelisk
pkgver=1.13.2
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
sha256sums=('c57517b04919f747022cca5a15431a3a95e07f081aecb00d46b23f19948dc0ef'
            'c6bae41e16c9ff7237953a88513ce71e673c798d785810e81cb258633f16a10b')

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

