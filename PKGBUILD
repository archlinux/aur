# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>

_pkgname=buildtools
pkgname=buildifier
pkgver=7.3.1
pkgrel=5
pkgdesc='A command line tool to format Bazel BUILD files'
arch=('x86_64' 'aarch64')
license=('Apache')
url='https://github.com/bazelbuild/buildtools'
makedepends=('bazel' 'git' 'python')
conflicts=('buildifier-bin')
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

