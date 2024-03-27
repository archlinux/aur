# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=7.1.0
_commit=66c6051739542b50723c420191346ec238a090db
pkgrel=2
pkgdesc="A bazel BUILD file formatter and editor"
arch=('x86_64')
url='https://github.com/bazelbuild/buildtools'
license=('Apache-2.0')
makedepends=("bazel")
source=("bazel-buildtools-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "status.sh")
sha256sums=('061472b3e8b589fb42233f0b48798d00cf9dee203bd39502bd294e6b050bc6c2'
            'c750fb95d15f029e0ae9b18078f3dfe85c6b074ca141a5f0b3145dba52f346ce')

build() {
  cp status.sh $srcdir/buildtools-$pkgver
  cd $srcdir/buildtools-$pkgver
  bazel build -c opt --stamp --workspace_status_command="bash status.sh $pkgver $_commit" //buildifier //buildozer //unused_deps
  bazel shutdown
}

package() {
  cd $srcdir/buildtools-$pkgver
  install -Dm755 -t $pkgdir/usr/bin ./bazel-bin/buildifier/buildifier_/buildifier ./bazel-bin/buildozer/buildozer_/buildozer ./bazel-bin/unused_deps/unused_deps_/unused_deps
}
