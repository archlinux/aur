# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=5.1.0
pkgrel=1
arch=('x86_64')
url='https://github.com/bazelbuild/buildtools'
license=('Apache')
pkgdesc="Developer tools for working with Google's bazel buildtool."
makedepends=("bazel" "git")
depends=("java-runtime=11")

source=("$url/archive/$pkgver.tar.gz")
sha256sums=("e3bb0dc8b0274ea1aca75f1f8c0c835adbe589708ea89bf698069d0790701ea3")

build() {
  cd buildtools-$pkgver
  PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH" bazel build //buildifier //buildozer //unused_deps
}

package() {
  cd buildtools-$pkgver
  install -d "$pkgdir"/usr/bin
  install -Dm755 bazel-bin/buildifier/*/buildifier bazel-bin/buildozer/*/buildozer bazel-bin/unused_deps/*/unused_deps $pkgdir/usr/bin/
}

