# Maintainer: lantw44 (at) gmail (dot) com
# Modified from guix-git 20130119 PKGBUILD 

pkgname=guix
pkgver=0.2
pkgrel=2
pkgdesc="GNU guix is a purely functional package manager"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/guix/"
license=('GPL')
depends=('guile>=2.0.5' 'sqlite>=3.6.19' 'bzip2' 'libgcrypt')
makedepends=()
source=('ftp://alpha.gnu.org/gnu/guix/guix-0.2.tar.gz')
md5sums=('4bdbbd736d0bbcb6cd7e28220c4ea1fe')

build() {
	current_arch="`uname -m`"
	cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --localstatedir=/var \
		--disable-rpath --with-system=${current_arch}-linux
    make
}

# guix-0.2 cannot pass all tests because of some strange problems.
# eg. build.sh or bipvm5958i36 not found

#check() {
#	cd ${srcdir}/${pkgname}-${pkgver}
#    make -k -j1 check  
#}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
#	only required if enabling check()
#	chmod -R u+w test-tmp
}
