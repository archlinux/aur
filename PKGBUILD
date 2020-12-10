#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=mfakto
pkgver=0.15pre7
pkgrel=1
pkgdesc="An OpenCL program for Mersenne prefactoring."
arch=('x86_64')
url="https://mersenneforum.org/showthread.php?t=15646"
license=('GPL3')
depends=('ocl-icd' 'opencl-headers' 'opencl-driver')
source=("https://download.mersenne.ca/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}-src.zip"
'make.patch')
md5sums=('e382f2c58ff1b7cde193ac776878d51a'
'93a017fa68adea89184efba1268b0aaf')
sha256sums=('09874202640fe38d3f4ecf056bbed7cbf10daeedf083e3528efe27b2e3982e58'
'SKIP')

prepare () {
    cd ${srcdir}/mfakto-master/src
    patch -p2 < "../../make.patch"
}

build () {
cd ${srcdir}/mfakto-master/src
make -f Makefile all
}

package () {
cd ${srcdir}/mfakto-master/
install -Dm755 mfakto ${pkgdir}/usr/bin/mfakto
install -Dm755 mfakto.ini ${pkgdir}/etc/mfakto/mfakto.ini
echo "A default mfakto.ini file will be installed"
echo "in /etc/mfakto/mfakto.ini. Copy this to the"
echo "directory where you want to run mfakto."
}