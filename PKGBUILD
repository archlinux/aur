# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Byron Clark <byron@theclarkfamily.name>
pkgname=thrift-java
pkgver=0.9.1
pkgrel=1
pkgdesc="Java bindings for Thrift, a scalable cross-language services framework for IPC/RPC"
arch=(i686 x86_64)
url="http://thrift.apache.org/"
license=(APACHE)
depends=(zlib libevent openssl java-runtime)
makedepends=(automake autoconf libtool apache-ant java-environment)
optdepends=(
  'thrift-base: for the Thrift compiler'
  'vim-thrift: for syntax highlighting in vim')
options=(!emptydirs !makeflags)
source=(http://www.apache.org/dist/thrift/$pkgver/thrift-$pkgver.tar.gz
        maven-repo-path.patch)
md5sums=('d2e46148f6e800a9492dbd848c66ab6e'
         'bfcb3b12a8c07d5d0d9e96a7e712a74c')

build() {
  cd $srcdir/thrift-$pkgver

  patch -p1 -i $srcdir/maven-repo-path.patch

  # apache-ant is not installed in a normal path location
  . /etc/profile.d/apache-ant.sh

  ./configure --prefix=/usr \
    --without-cpp \
    --without-qt4 \
    --without-c_glib \
    --without-csharp \
    --with-java \
    --without-erlang \
    --without-perl \
    --without-php \
    --without-php_extension \
    --without-python \
    --without-ruby \
    --without-haskell \
    --without-go \
    --without-d

  make
}

package() {
  cd $srcdir/thrift-$pkgver
  make DESTDIR=$pkgdir install
  rm -r $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
