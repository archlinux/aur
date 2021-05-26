# Maintainer: Sergii Fesenko <sergii_f@outlook.com>

pkgname=lucene-grep-git
_pkgname=lucene-grep
pkgver=2021.05.23.1.gfc9c49a
pkgrel=1
pkgdesc="Grep-like utility based on Lucene Monitor compiled with GraalVM native-image"
arch=(i686 x86_64)
url="https://github.com/dainiusjocas/lucene-grep"
license=('APACHE')
conflicts=(lucene-grep)
provides=(lucene-grep)
depends=(zlib)
makedepends=(git make clojure native-image-jdk11-bin)
source=('git+https://github.com/dainiusjocas/lucene-grep.git')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed 's/-/./g; s/-g/./; s/^v//'
}

build() {
  cd "$srcdir/$_pkgname"
  GRAALVM_HOME=/usr/lib/jvm/java-11-graalvm make build
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/

  cd $srcdir/$_pkgname
  cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
  install -D lmgrep "$pkgdir"/usr/bin/lmgrep
}

