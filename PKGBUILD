# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=bazelisk
pkgver=1.19.0
pkgrel=1
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
sha256sums=('4c291875707cdd98da87ad34e287c06384436f60cb76e2ac03c32d51f48c96ce')

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

