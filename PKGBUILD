# Maintainer: Dylan <dylan@hashflo.net>

pkg_base=dogecoin
pkgname=('dogecoin-daemon')
pkgver=1.10.0
_git_branch=master
pkgrel=4
arch=('i686' 'x86_64')
url='http://dogecoin.com/'
makedepends=('boost' 'automoc4' 'protobuf')
conflicts=('dogecoin-qt')
license=('MIT')
source=(
    https://github.com/$pkg_base/$pkg_base/archive/$_git_branch.tar.gz
)
sha256sums=(
    '8dc2125a5e36fd20b471ab63a8db837566528b3a23079fdc24da8573d7d98d1a'
)
install=$pkgname.install

build() {
  cd $srcdir/$pkg_base-$_git_branch
  ./autogen.sh
  ./configure --enable-cxx --prefix=/usr --with-gui=no --disable-tests --without-miniupnpc --with-incompatible-bdb
  make
}

package_dogecoin-daemon() {
  pkgdesc='Dogecoin is a peer-to-peer network based digital currency - daemon'
  depends=(boost-libs openssl)
  cd $srcdir/$pkg_base-$_git_branch
  install -Dm755 src/$pkg_base'd' $pkgdir/usr/bin/$pkg_base'd'
  install -Dm755 src/$pkg_base'-cli' $pkgdir/usr/bin/$pkg_base'-cli'
  install -Dm644 contrib/debian/examples/$pkg_base.conf $pkgdir/usr/share/doc/$pkgname/examples/$pkg_base.conf
  install -Dm644 contrib/debian/manpages/$pkg_base'd.1' $pkgdir/usr/share/man/man1/$pkg_base'd.1'
  install -Dm644 contrib/debian/manpages/$pkg_base.conf.5 $pkgdir/usr/share/man/man5/$pkg_base.conf.5
  install -Dm644 COPYING '$pkgdir/usr/share/licenses/$pkgname/COPYING'
}

