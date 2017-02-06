# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=autotrace
pkgver=0.31.1
pkgrel=17
pkgdesc='An utility to trace bitmaps: convert bitmaps to vector graphics'
arch=('i686' 'x86_64')
url='http://autotrace.sourceforge.net/'
license=('GPL' 'LGPL')
depends=('imagemagick>=6.5.3.10' 'libpng')
optdepends=('pstoedit')
makedepends=('pstoedit')
options=('!libtool')
source=("https://sourceforge.net/projects/$pkgname/files/AutoTrace/$pkgver/$pkgname-$pkgver.tar.gz"
        "complete.patch")
md5sums=('54eabbb38d2076ded6d271e1ee4d0783'
         '60cdd0d29d7ab79b71b9b6e579a82b6a')
sha512sums=('7d0ec86a41617b3d4336eed72f2974c10f569ff53d450a4c91b4611bb6fdb8c4ff81d04d91e9d20f1b4df592f82c8421e7656af7fa2bdc786ffb4618e9eadd24'
            '92c984a6d7bea6b58ce3fc8419d89af9c52d2029e91b0fe3e29f05f10b18d75742abff828cec551a4e8da44a22c563e321fcd91ceb3a186c040cf465fef77b97')

prepare(){
  cd "$pkgname-$pkgver"
  patch < ../complete.patch
  autoreconf -ivf
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --with-pstoedit
  sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
  sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
  make
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}"
}
