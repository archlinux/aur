#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=mfaktc
pkgver=0.21
pkgrel=2
pkgdesc="A CUDA program for Mersenne prefactoring."
arch=('x86_64')
url="https://mersenneforum.org/showthread.php?t=12827"
license=('GPL3')
depends=('nvidia')
makedepends=('cuda<11.2.0')
source=("https://download.mersenne.ca/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
"mfaktc.ini"
"makeandparams.patch")
md5sums=('292d9a3bee013e9992ab199dfdfeece9'
'edf7197ee8d1e5d99ce8a9acf9287ea7'
'2acc9b787a77a2e6ba07cbd0904c776b')
sha256sums=('1973b5fae564035a33aa89bcb1a7e6dae571307a874e2eeb845e5b93939c2079'
'SKIP'
'SKIP')

prepare() {
cd ${srcdir}/${pkgname}-${pkgver}/src
patch -p2 < "../../../makeandparams.patch"
}

build () {
cd ${srcdir}/${pkgname}-${pkgver}/src
make -f Makefile all
}

package () {
cd ${srcdir}/${pkgname}-${pkgver}
install -Dm755 mfaktc.exe ${pkgdir}/usr/bin/mfaktc
cd ..
install -Dm755 mfaktc.ini ${pkgdir}/etc/mfaktc/mfaktc.ini
echo "A default mfaktc.ini file will be installed"
echo "in /etc/mfaktc/mfaktc.ini. Copy this to the"
echo "directory where you want to run mfaktc."
}