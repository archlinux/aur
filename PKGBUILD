# Contributor: kaptoxic@yahoo.com
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Byron Clark <byron@theclarkfamily.name>

pkgname=thrift-java
pkgver=0.9.3
pkgrel=1
pkgdesc="Java bindings for Thrift, a scalable cross-language services framework for IPC/RPC"
arch=(i686 x86_64)
url="http://thrift.apache.org/"
license=(APACHE)
depends=(gcc-libs openssl java-runtime)
makedepends=(automake libevent autoconf libtool apache-ant java-environment)
optdepends=(
  'thrift: for the Thrift compiler and syntax highlighting in vim/emacs')
options=(!emptydirs !makeflags)
source=(https://github.com/apache/thrift/archive/$pkgver.tar.gz
        maven-repo-path.patch)
md5sums=('193ecb66ff1cc4282e7625aa263622bf'
         'bfcb3b12a8c07d5d0d9e96a7e712a74c')

build() {
  cd $srcdir/thrift-$pkgver

  patch -p1 -i $srcdir/maven-repo-path.patch

  # apache-ant is not installed in a normal path location
  . /etc/profile.d/apache-ant.sh

  ./bootstrap.sh
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
    --without-d \
    --without-haskell \
    --without-php \
    --without-ruby \
    --without-python \
    --without-erlang \
    --without-perl \
    --without-c_sharp \
    --without-d \
    --without-php \
    --without-go \
    --without-lua \
    --without-nodejs

  make
}

package() {
  cd $srcdir/thrift-$pkgver
  make DESTDIR=$pkgdir install
  rm -r $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
