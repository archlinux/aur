# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=4.2.2
pkgrel=1
arch=('x86_64')
url='https://github.com/bazelbuild/buildtools'
license=('Apache')
pkgdesc="Developer tools for working with Google's bazel buildtool."
makedepends=("bazel" "git")

source=("$url/archive/$pkgver.tar.gz")
sha256sums=("ae34c344514e08c23e90da0e2d6cb700fcd28e80c02e23e4d5715dddcb42f7b3")

build() {
  cd buildtools-$pkgver
  bazel build //buildifier //buildozer //unused_deps
}

package() {
  cd buildtools-$pkgver
  install -d "$pkgdir"/usr/bin
  install -Dm755 bazel-bin/buildifier/*/buildifier bazel-bin/buildozer/*/buildozer bazel-bin/unused_deps/*/unused_deps $pkgdir/usr/bin/
}

