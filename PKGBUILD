# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=bazelisk
pkgver=1.13.0
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
sha256sums=('2b4959d0011b26ee6f3407d523b32cc74057770236e0d4ea662a0cbf37fd578e'
            'f99b1b16046e5ca12aaa872b33abcb63f0545051fb09d5aaddc96667f5d2d12d')

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

