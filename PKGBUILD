# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=bazelisk
pkgver=1.15.0
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
sha256sums=('0105d0e77ffda5a54d908e8781c5ed5551cd2810291c7b7071308bf0b387e4c1'
            '19fd84262d5ef0cb958bcf01ad79b528566d8fef07ca56906c5c516630a0220b')

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

