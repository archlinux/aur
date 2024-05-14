# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=7.1.1
_commit=2bc4b5ebbaafd5854b9fe09f117f0ede48cacee5
pkgrel=1
pkgdesc="A bazel BUILD file formatter and editor"
arch=('x86_64')
url='https://github.com/bazelbuild/buildtools'
license=('Apache-2.0')
makedepends=("bazel")
source=("bazel-buildtools-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "status.sh")
sha256sums=('60a9025072ae237f325d0e7b661e1685f34922c29883888c2d06f5789462b939'
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
