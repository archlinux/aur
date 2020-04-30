# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=3.0.0
pkgrel=1
arch=('x86_64')
url='https://github.com/bazelbuild/buildtools'
license=('Apache')
pkgdesc="Developer tools for working with Google's bazel buildtool."
makedepends=("bazel" "git")

source=("$url/archive/$pkgver.tar.gz")
sha256sums=("a0e79f5876a1552ae8000882e4189941688f359a80b2bc1d7e3a51cab6257ba1")

build() {
  cd buildtools-$pkgver
  bazel build //buildifier //buildozer //unused_deps
}

package() {
  cd buildtools-$pkgver
  install -d "$pkgdir"/usr/bin
  install -Dm755 bazel-bin/buildifier/*/buildifier bazel-bin/buildozer/*/buildozer bazel-bin/unused_deps/*/unused_deps $pkgdir/usr/bin/
}

