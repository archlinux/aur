# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=bazelisk
pkgver=1.18.0
pkgrel=4
pkgdesc='A user-friendly launcher for Bazel.'
arch=('x86_64')
url='https://github.com/bazelbuild/bazelisk'
license=('Apache')
makedepends=('go' 'git')
# https://github.com/bazelbuild/bazelisk#installation
# We should add both `bazelisk` and `bazel` to PATH
provides=('bazel')
conflicts=('bazel' 'bazelisk-bin')
source=("bazelisk-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5435bdcfbca7dc3a1f68848779c6ad77503f0299ddecdd1f8d1272b88d9588d2')

build() {
  cd $srcdir/bazelisk-$pkgver
  go build
  ./bazelisk build --config=release //:bazelisk-linux-amd64
  ./bazelisk shutdown
}

package() {
  cd $srcdir/bazelisk-$pkgver
  install -Dm755 ./bazel-bin/bazelisk-linux_amd64 $pkgdir/usr/bin/bazelisk
  ln -s /usr/bin/bazelisk $pkgdir/usr/bin/bazel
}

