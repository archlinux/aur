# Maintainer: Sergii Fesenko <sergii_f@outlook.com>

pkgname=lucene-grep-git
_pkgname=lucene-grep
pkgver=v2021.04.26.r6.a00056d
pkgrel=1
pkgdesc="Grep-like utility based on Lucene Monitor compiled with GraalVM native-image"
arch=(i686 x86_64)
url="https://github.com/dainiusjocas/lucene-grep"
license=('APACHE')
conflicts=(lucene-grep)
depends=('zlib')
makedepends=('git' 'make' 'clojure')
source=('git+https://github.com/dainiusjocas/lucene-grep.git')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed 's/-/.r/; s/-g/./'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/

  cd $srcdir/$_pkgname
  cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
  install -D lmgrep "$pkgdir"/usr/bin/lmgrep
}

