# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname="ibazel"
pkgver="0.23.2"
pkgrel="1"
pkgdesc="Tool for building Bazel targets when source files change."
arch=("i686" "x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazel-watcher"
makedepends=("bazel" "git" "python")
depends=("bazel")

source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("e7f68d8b37955931ae73611225f05c9f1b678871891c486c450846276550966b")

build() {
  cd bazel-watcher-$pkgver
  bazel build //cmd/ibazel:ibazel --config release --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64
}

package() {
  cd bazel-watcher-$pkgver
  install -Dm755 bazel-bin/cmd/ibazel/ibazel_/ibazel "$pkgdir"/usr/bin/ibazel
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/ibazel/LICENSE
}

