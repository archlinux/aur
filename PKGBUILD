# Maintainer and Contributor: Vladimir Kamensky  <mastersoft24@yandex.ru>


pkgname=grive2
pkgver=0.3
pkgrel=1
pkgdesc="Open source Linux client for Google Drive"
arch=('i686' 'x86_64')
url="https://mastersoft24.github.io/Grive2"
license=('GPL')
categories=('network')
#if [ "${CARCH}" = 'x86_64' ]; then
#    depends=('gcc-libs-multilib' 'lib32-curl' 'lib32-json-c' 'lib32-openssl' 'boost' 'lib32-libgcrypt' 'lib32-#expat' 'yajl')
#elif [ "${CARCH}" = 'i686' ]; then
#    depends=('gcc-libs' 'curl' 'json-c' 'openssl' 'boost-libs' 'libgcrypt' 'expat' 'yajl')
#fi

depends=('json-c' 'curl' 'boost-libs' 'expat' 'libgcrypt' 'yajl')
#makedepends=('cmake' 'cppunit' 'boost')
makedepends=('cmake' 'git' 'boost' 'yajl' 'json-c' )
options=(!emptydirs)

source=("https://github.com/MasterSoft24/Grive2/archive/$pkgver.tar.gz")

md5sums=("98b8d726e15dbebb8d419854d98e9951")


build() {
	cd "$srcdir/Grive2-$pkgver"
	
  
  

  rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_EXE_LINKER_FLAGS=-ljson-c

 make   
}
 
package() {
	cd "$srcdir/Grive2-$pkgver/build"
	
	make DESTDIR="$pkgdir" install

	#mkdir "${pkgdir}/usr/lib"
	#ln -s "/usr/lib/libboost_program_options.so" "${pkgdir}/usr/lib/libbost_program_options.so.1.56.0"
	#ln -s "/usr/lib/libboost_filesystem.so" "${pkgdir}/usr/lib/libboost_filesystem.so.1.56"

}
