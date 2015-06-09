# Maintainer: Eric Biggers <ebiggers3@gmail.com>

pkgname=dnaa
pkgver=0.1.2
pkgrel=3
pkgdesc='An analysis package for short reads from next-generation sequencing'
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/mediawiki/dnaa/index.php?title=Main_Page"
license=('GPL2')
depends=('zlib' 'bzip2' 'r' 'perl')
makedepends=('gawk')
conflicts=('dwgsim')

# Upstream doesn't provide a way to use already-installed bfast or samtools...
source=(
"http://downloads.sourceforge.net/project/bfast/bfast/0.7.0/bfast-0.7.0a.tar.gz"
"http://downloads.sourceforge.net/project/samtools/samtools/0.1.18/samtools-0.1.18.tar.bz2"
"http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
)

build() {
  cd ${pkgname}-${pkgver}
  [[ ! -L bfast ]] && ln -s ../bfast-0.7.0a bfast
  [[ ! -L samtools ]] && ln -s ../samtools-0.1.18 samtools
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
md5sums=('9b0574dce903ab83e39e371b0a3bbbc6'
         '71dab132e21c0766f0de84c2371a9157'
         'a11eb449af9bf14906d00fdba5150ead')
