# Maintainer: M0Rf30

pkgname=coral
pkgver=3.9.4
pkgrel=1
pkgdesc="A set of drivers, libraries, utilities and analysis software for ATM and PoS OCx monitors and pcap interfaces"
url="https://www.caida.org/tools/measurement/coralreef/status.xml"
arch=('i686' 'x86_64')   
depends=('perl')
source=("https://www.caida.org/tools/measurement/coralreef/dists/$pkgname-$pkgver.tar.gz"
	patch.diff)

license=('MIT')

package() {
    cd $srcdir/$pkgname-$pkgver
    patch -Np1 -i ../patch.diff 
    find . -type f -exec sed -i -e 's/-DHAS_BOOL/-D__USE_BSD -D_GNU_SOURCE/g' {} +
    ./configure --prefix=/usr
    make
    make DESTDIR=$pkgdir install
}

md5sums=('c2e392d097e7afa7c087c0a2b5af0dd8'
         '199ab35e8d42242c263c827387ea11d8')
