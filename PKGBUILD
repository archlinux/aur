# Maintainer: Invarianz <invarianztheorem [at] web [dot] de>
# Contributor: cmichi <mich [at] elmueller [dot] net>
#
# This package provides the latest offical, upstream nvi
# with multibyte support enabled.

pkgname=nvi-multibyte-git
pkgdesc="Upstream nvi with enabled multibyte support"
arch=('x86_64')
url="git://repo.or.cz/nvi.git"
license=("BSD")
conflicts=("nvi")

_COMMIT="864873d3f353ab3e54040817ec562bd3b346b55f"
source=("http://repo.or.cz/nvi.git/snapshot/$_COMMIT.tar.gz")
md5sums=('c146491156559ff069e2cfd64c97075c')

# the last official release was 1.81.6, but there have been
# commits since then. Timestamp (yyyymmdd) of latest commit is appended.
pkgver=1.81.6_20200915
pkgrel=1
_COMMIT_HASH="${_COMMIT:0:7}"

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
