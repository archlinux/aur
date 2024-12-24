# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

pkgname=buildifier
pkgver=7.3.1
pkgrel=1
pkgdesc='A command line tool to rewrite Bazel BUILD files using standard conventions'
arch=('x86_64' 'aarch64')
license=('Apache')
url='https://github.com/bazelbuild/buildtools'
makedepends=('bazel' 'git' 'python')
conflicts=('buildozer-bin')
_commit='45b7ddb516e521e68794bf409d73ff8a32641de3'
source=("${pkgname}::git+$url.git#commit=$_commit")
md5sums=('SKIP')

build() {
  cd "${pkgname}" || exit

  bazel build --config=release "//${pkgname}"
  bazel shutdown
}

package() {
  cd "${pkgname}" || exit

  # Install the license file
  install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install the binary
  install -D -m 0755 \
    "./bazel-bin/${pkgname}/${pkgname}_/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
}

