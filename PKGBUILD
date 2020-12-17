#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=cudapm1
pkgver=0.22
pkgrel=2
pkgdesc="Program that implements the P-1 algorithm for factoring Mersenne numbers."
arch=('x86_64')
url=https://mersenneforum.org/showthread.php?t=17835
license=('GPL3')
depends=('nvidia')
makedepends=('cuda<11.2.0' 'yasm')
source=('https://download.mersenne.ca/CUDAPm1/CUDAPm1-0.22-src.tar.gz'
make.patch)
md5sums=('b7cf8f28438109edf3528d4d53802212'
'1996bf1d5510deb0456ad13c3a4d7834')
sha256sums=('c0a257bb4f92af64e73626cb36427ca5fe9c01e57f59b96c4970afe8f7ae64c2'
'SKIP')

prepare () {
cd ${srcdir}/cuda-p1-${pkgver}/
patch -p1 < ../make.patch
cd src/
rm -rf mpir/
wget "https://github.com/BrianGladman/mpir/archive/master.zip"
unzip master.zip
mv mpir-master/ mpir/
}

build () {
cd ${srcdir}/cuda-p1-${pkgver}/
make
}

package() {
cd ${srcdir}/cuda-p1-${pkgver}/
install -Dm755 CUDAPm1 ${pkgdir}/usr/bin/cudapm1
}