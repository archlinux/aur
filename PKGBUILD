# $Id: PKGBUILD 121750 2014-11-03 16:11:38Z anatolik $
# Maintainer: Anatol Pomozov
# Contributor: Byron Clark <byron@theclarkfamily.name>

# This package contains only thrift compiler and C/C++ libraries
# for all the language binding one should use corresponding language-specific package manager:
# CPAN for perl, gem for ruby, pip for python etc... Or better to create arch packages that install
# the binding from the language specific managers python2-thrift, perl-thrift, ruby-thrift, ...

pkgname=thrift-git
pkgver=0.9.2.r3833.4f4b15b
pkgrel=1
pkgdesc='Scalable cross-language services framework for IPC/RPC'
arch=(i686 x86_64)
url='http://thrift.apache.org/'
license=(APACHE)
depends=(gcc-libs openssl)
makedepends=(boost libevent git)
conflicts=(thrift)
provides=(thrift)
replaces=(thrift)
source=(git://github.com/apache/thrift)
sha1sums=('SKIP')

pkgver() {
  cd thrift
  echo 0.9.2.r$(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd thrift

  ./bootstrap.sh
  ./configure --prefix=/usr \
              --with-cpp \
              --with-c_glib \
              --with-libevent \
              --without-haskell \
              --without-php \
              --without-ruby \
              --without-python \
              --without-erlang \
              --without-perl \
              --without-java \
              --without-c_sharp \
              --without-d \
              --without-php \
              --without-go \
              --without-lua \
              --without-nodejs \
              --without-tests
              
  make
}

package() {
  cd thrift
  make DESTDIR="$pkgdir" install

  install -m0644 -D contrib/thrift.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/thrift.vim
  install -m0644 -D contrib/thrift.el "$pkgdir"/usr/share/emacs/site-lisp/thrift.el
}
