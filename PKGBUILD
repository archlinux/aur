# Contributor: kamu <mr.kamu@gmail.com>
pkgname=ruby-svn
pkgver=26650
pkgrel=1
pkgdesc="A dynamic, open source programming language with a focus on simplicity and productivity."
arch=(i686 x86_64)
url="http://www.ruby-lang.org/en/"
license="Ruby"
depends=('glibc' 'gdbm' 'db' 'openssl' 'zlib' 'readline')
makedepends=('subversion' 'autoconf')

source=()
md5sums=()

_svntrunk="http://svn.ruby-lang.org/repos/ruby/trunk/"
_svnmod="trunk"
_suffix="-svn"
_version="svn"

build() {
	cd $startdir/src/
	svn co $_svntrunk $_svnmod
 	cd $_svnmod
	autoconf

	./configure --prefix=/usr --enable-shared --enable-pthread \
	--program-suffix=${_suffix} --with-ruby-version=${_version} \
	--with-soname=ruby${_suffix}
	make || return 1
	make DESTDIR=${startdir}/pkg install || return 1
	make DESTDIR=${startdir}/pkg install-doc || return 1
}
