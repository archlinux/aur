# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

_pkgname=buildtools
pkgname=buildozer
pkgver=3.2.0
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
md5sums=('bc6937fc34d06bf038861c43502ce74c')

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
