# Maintainer: patrick <patrick at neumannsland dot de>
# Brought to you by: amedico, cordovano, jessekornblum, lowej, mlevendo
# Patch by: mschlenker

pkgname=dc3dd
pkgver=7.2.646
pkgrel=2
pkgdesc="is a patch to the GNU dd program, this version has several features intended for forensic acquisition of data."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/dc3dd/"
license=('GPL3')
makedepends=('autoconf' 'perl-locale-gettext')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}%20${pkgver}/${pkgname}-${pkgver}.zip"
        "http://distfiles.lesslinux.org/dc3dd-7.2.646_glibc-2.28-1.patch")
sha256sums=('c4e325e5cbdae49e3855b0849ea62fed17d553428724745cea53fe6d91fd2b7f'
            '0c3ef49b7bf4952ed94df1e54495ca1df2f081cba34cd421c14cff267cb9866c')
 
prepare() {
   cd $pkgname-$pkgver
   patch -Np1 -i "${srcdir}/dc3dd-7.2.646_glibc-2.28-1.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  chmod u+x ./configure
  ./configure --prefix=/usr --libexecdir="/usr/lib/${pkgname}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
