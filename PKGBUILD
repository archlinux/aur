# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

_pkgname=buildtools
pkgname=buildozer
pkgver=3.5.0
pkgrel=1
pkgdesc="A command line tool to rewrite Bazel BUILD files using standard conventions"
arch=('x86_64')
license=('Apache')
url="https://github.com/bazelbuild/buildtools"
makedepends=(
  'bazel'
  'git'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('33bc6109ba908d6d256cb1118db9e780')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  bazel build "//${pkgname}:${pkgname}-linux"
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Install the license file
  install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/buildozer/LICENSE"

  # Install the binary
  install -D -m 0755 \
    "./bazel-bin/${pkgname}/${pkgname}-linux_amd64" \
    "${pkgdir}/usr/bin/buildozer"
}
