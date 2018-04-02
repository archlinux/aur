# Maintainer: Dylan <dylan@psilly.com>

pkg_base=dogecoin
pkgname=('dogecoin-daemon')
pkgver=1.14.0.2
_full_pkgver='1.14-alpha-2'
pkgrel=1
arch=('i686' 'x86_64')
url='http://dogecoin.com/'
makedepends=('boost' 'automoc4' 'protobuf')
conflicts=('dogecoin-qt')
license=('MIT')
source=(
    https://github.com/$pkg_base/$pkg_base/archive/v$_full_pkgver.tar.gz
)
sha256sums=(
    'd76d6c9f42304aa617668da145a14aba858fedea69bfccebbdc6fe15c49b3b4d'
)
install=$pkgname.install

build() {
  cd $srcdir/$pkg_base-$_full_pkgver
  ./autogen.sh
  ./configure --enable-cxx --prefix=/usr --with-gui=no --disable-tests --without-miniupnpc --with-incompatible-bdb
  make
}

package_dogecoin-daemon() {
  pkgdesc='Dogecoin is a peer-to-peer network based digital currency - daemon'
  depends=('boost-libs' 'openssl')
  cd $srcdir/$pkg_base-$_full_pkgver
  install -Dm755 src/$pkg_base'd' $pkgdir/usr/bin/$pkg_base'd'
  install -Dm755 src/$pkg_base'-cli' $pkgdir/usr/bin/$pkg_base'-cli'
  install -Dm644 contrib/debian/examples/$pkg_base.conf $pkgdir/usr/share/doc/$pkgname/examples/$pkg_base.conf
  install -Dm644 contrib/debian/manpages/$pkg_base'd.1' $pkgdir/usr/share/man/man1/$pkg_base'd.1'
  install -Dm644 contrib/debian/manpages/$pkg_base.conf.5 $pkgdir/usr/share/man/man5/$pkg_base.conf.5
  install -Dm644 COPYING '$pkgdir/usr/share/licenses/$pkgname/COPYING'
}

