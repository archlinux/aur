# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=6.3.3
pkgrel=2
pkgdesc="A bazel BUILD file formatter and editor"
arch=('x86_64')
url='https://github.com/bazelbuild/buildtools'
license=('Apache')
makedepends=("bazel")

source=("bazel-buildtools-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('42968f9134ba2c75c03bb271bd7bb062afb7da449f9b913c96e5be4ce890030a')

build() {
  cd $srcdir/buildtools-$pkgver
  bazel build //buildifier //buildozer //unused_deps
  bazel shutdown
}

package() {
  cd $srcdir/buildtools-$pkgver
  install -Dm755 -t $pkgdir/usr/bin ./bazel-bin/buildifier/buildifier_/buildifier ./bazel-bin/buildozer/buildozer_/buildozer ./bazel-bin/unused_deps/unused_deps_/unused_deps
}

