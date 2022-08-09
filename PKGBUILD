# Maintainer: Sergii Fesenko <sergii_f@outlook.com>

pkgname=lucene-grep-git
pkgver=2022.07.27.3.g944f12f
pkgrel=1
pkgdesc="Grep-like utility based on Lucene Monitor compiled with GraalVM native-image"
arch=(i686 x86_64)
url="https://github.com/dainiusjocas/lucene-grep"
license=('APACHE')
conflicts=(lucene-grep)
provides=(lucene-grep)
depends=(zlib)
makedepends=(
  git
  make
  clojure
  jdk17-graalvm-bin
  native-image-jdk17-bin)
source=('git+https://github.com/dainiusjocas/lucene-grep.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags --long | sed 's/-/./g; s/-g/./; s/^v//'
}

build() {
  cd "${pkgname%-git}"
  GRAALVM_HOME=/usr/lib/jvm/java-17-graalvm \
    make build
}

package() {
  cd "${pkgname%-git}"

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/

  cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
  install -D lmgrep "$pkgdir"/usr/bin/lmgrep
}
