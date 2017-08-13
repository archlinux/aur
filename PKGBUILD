# Maintainer: cmichi <mich [at] elmueller [dot] net>
#
# This package aims to provide the latest offical, upstream nvi
# with multibyte support enabled.

pkgname=nvi-multibyte-upstream
pkgdesc="Upstream nvi with enabled multibyte support"
arch=('x86_64')
url="git://repo.or.cz/nvi.git"
license=("BSD")

_COMMIT="f462fedd26f78eec1998da4b9cba360095a6aa53"
source=("http://repo.or.cz/nvi.git/snapshot/$_COMMIT.tar.gz")
md5sums=("c9b282080e8d61f933f8e2d3bfb7dc2d")

# the last official release was 1.81.6, but there have been
# commits since then. hence i append the timestamp of the
# latest commit to the version number.
pkgver=1.81.6_20161009
_COMMIT_HASH="${_COMMIT:0:7}"

pkgrel=1

build(){
  cd "$srcdir"/nvi-$_COMMIT_HASH/dist/
  ./distrib
  cd ../build.unix

  ../dist/configure \
    --prefix="$pkgdir"/usr \
    --program-prefix=n \
    --enable-widechar # for multibyte support

  make
}

package(){
  cd "$srcdir"/nvi-$_COMMIT_HASH/build.unix

  make install

  # license
  install -Dm644 "$srcdir"/nvi-$_COMMIT_HASH/LICENSE \
          "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
