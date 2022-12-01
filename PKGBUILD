# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname="ibazel"
pkgver="0.21.0"
pkgrel="1"
pkgdesc="Tool for building Bazel targets when source files change."
arch=("i686" "x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazel-watcher"
makedepends=("bazel" "git" "python")
depends=("bazel")

source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("c6413d3298c51d968bbbe8a01f481b83947e55eae6af78c0b8268a91e02d7989")

build() {
  cd bazel-watcher-$pkgver
  bazel build //cmd/ibazel:ibazel --config release --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64
}

package() {
  cd bazel-watcher-$pkgver
  install -Dm755 bazel-bin/cmd/ibazel/ibazel_/ibazel "$pkgdir"/usr/bin/ibazel
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/ibazel/LICENSE
}

