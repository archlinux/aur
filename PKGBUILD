# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=2.2.0
pkgrel=2
arch=('x86_64')
url='https://github.com/bazelbuild/buildtools'
license=('Apache')
pkgdesc="Developer tools for working with Google's bazel buildtool."
makedepends=("bazel" "git")

source=("$url/archive/$pkgver.tar.gz")
sha256sums=("069617be63d72c2c70a14d832102a98d65fe12e02661f7c42797bc390c80017f")

build() {
  cd buildtools-$pkgver
  bazel build //buildifier //buildozer //unused_deps
}

package() {
  cd buildtools-$pkgver
  install -d "$pkgdir"/usr/bin
  install -Dm755 bazel-bin/buildifier/*/buildifier bazel-bin/buildozer/*/buildozer bazel-bin/unused_deps/*/unused_deps $pkgdir/usr/bin/
}

