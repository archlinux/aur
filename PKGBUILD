# Maintainer: archdub <groknok [at] gmail [dot] com>
# Contributor: Invarianz <invarianztheorem [at] web [dot] de>
# Contributor: cmichi <mich [at] elmueller [dot] net>

# This package provides the latest snapshot of nvi with multibyte support enabled.
# This package used to be called "nvi-multibyte-upstream".

pkgname=nvi-multibyte-git
pkgdesc="nvi with multibyte support"
arch=('x86_64')
url="git://repo.or.cz/nvi.git"
license=("BSD")
conflicts=('nvi' 'nvi-multibyte-upstream')
provides=('nvi')

_COMMIT="ec6c4a2d8889319a21893cbaf2cc63d11598fba2"
source=("http://repo.or.cz/nvi.git/snapshot/$_COMMIT.tar.gz")
sha512sums=('a3505e209277c6f634176583be8d475b9e9733ba2ecece53c04abd79ef0975f9c458eec1ad7391e0e3ae9610e0348ac398c76156805dbc35bf32d49d3dd190ce')

# The last official release was 1.81.6, but there have been commits since then.
# Append timestamp (yyyymmdd) of latest commit.
pkgver=1.81.6_20240912
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
