# Maintainer: Vladimir Krivopalov <vladimir.krivopalov@gmail.com>

pkgname=thrift-0.10.0
pkgver=0.10.0
pkgrel=1
pkgdesc='Scalable cross-language services framework for IPC/RPC'
arch=(i686 x86_64)
url='http://thrift.apache.org/'
license=(APACHE)
depends=(gcc-libs openssl)
makedepends=(boost libevent git)
conflicts=('thrift' 'thrift-git')
provides=('thrift')
replaces=('thrift')
source=("git://github.com/apache/thrift.git#tag=${pkgver}")
sha1sums=('SKIP')

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
	make DESTDIR="${pkgdir}" install

	install -m0644 -D contrib/thrift.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/thrift.vim
	install -m0644 -D contrib/thrift.el "$pkgdir"/usr/share/emacs/site-lisp/thrift.el
}
