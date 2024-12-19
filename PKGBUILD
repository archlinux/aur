# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=bazelisk
pkgver=1.25.0
pkgrel=1
pkgdesc='A user-friendly launcher for Bazel.'
arch=('x86_64')
url='https://github.com/bazelbuild/bazelisk'
license=('Apache-2.0')
makedepends=('go' 'git')
# https://github.com/bazelbuild/bazelisk#installation
# We should add both `bazelisk` and `bazel` to PATH
provides=('bazel')
conflicts=('bazel' 'bazelisk-bin')
source=("bazelisk-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8ff4c6b9ab6a00fbef351d52fde39afc2b9f047865f219a89ed0b23ad6f8cf06')

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

