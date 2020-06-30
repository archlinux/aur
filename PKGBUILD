# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=3.3.0
pkgrel=1
arch=('x86_64')
url='https://github.com/bazelbuild/buildtools'
license=('Apache')
pkgdesc="Developer tools for working with Google's bazel buildtool."
makedepends=("bazel" "git")

source=("$url/archive/$pkgver.tar.gz")
sha256sums=("f11fc80da0681a6d64632a850346ed2d4e5cbb0908306d9a2a2915f707048a10")

build() {
  cd buildtools-$pkgver
  bazel build //buildifier //buildozer //unused_deps
}

package() {
  cd buildtools-$pkgver
  install -d "$pkgdir"/usr/bin
  install -Dm755 bazel-bin/buildifier/*/buildifier bazel-bin/buildozer/*/buildozer bazel-bin/unused_deps/*/unused_deps $pkgdir/usr/bin/
}

