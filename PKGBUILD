# Contributor: Max Devaine <maxdevaine@gmail.com>

pkgname=kde4-ftps-kio
pkgver=0.2
pkgrel=1
pkgdesc='An ftps KIO slave for KDE4, based on rfc4217 and build upon the ftp KIO-slave sources'
arch=(i686 x86_64)
url='http://kasablanca.berlios.de/kio-ftps/'
license=('GPL')
makedepends=('automoc4')
conflicts=('')
source=("kio-ftps-${pkgver}.tar.gz::http://sourceforge.net/projects/kasablanca.berlios/files/kio-ftps-${pkgver}.tar.gz/download")
md5sums=('33c555a9eee0cdfd68ae9050f6502069')

 build() {
    cd ${srcdir}/kio-ftps
    rm -rf *~
    sed -i -e "s:\${KDE4_KDECORE_LIBS}:\${KDE4_KIO_LIBS}:g" CMakeLists.txt || die "sed linking failed"
    cmake . -DCMAKE_INSTALL_PREFIX='/usr'
    make
 }

 package() {
    cd ${srcdir}/kio-ftps
    make DESTDIR=${pkgdir} install
}
