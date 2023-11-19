# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=6.4.0
_commit=433ea8554e82832e4fa4bdd530ca471564071511
pkgrel=1
pkgdesc="A bazel BUILD file formatter and editor"
arch=('x86_64')
url='https://github.com/bazelbuild/buildtools'
license=('Apache')
makedepends=("bazel")

source=("bazel-buildtools-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "status.sh")
sha256sums=('05c3c3602d25aeda1e9dbc91d3b66e624c1f9fdadf273e5480b489e744ca7269'
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
