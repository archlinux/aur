# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
# Contributor: Thomas Conneely tc116 at le dot ac dot uk

pkgname=epson-alc1100-filter
pkgver=1.2
pkgrel=2
pkgdesc="Print driver for Epson ALC1100 colour laser printer"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:EAPL')

if [ "${CARCH}" = 'i686' ]; then
	depends=('libstdc++5' 'ghostscript' 'psutils' 'sed' 'grep' 'gawk' 'bc')

elif [ "${CARCH}" = 'x86_64' ]; then
	depends=('lib32-gcc-libs' 'lib32-libstdc++5' 'ghostscript' 'psutils' 'sed' 'grep' 'gawk' 'bc')
fi

makedepends=()
optdepends=('cups: printing support')
source=("http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/58/64/87f759442ccaa26a3be70620d1aab13e7f713d60/Epson-ALC1100-filter-${pkgver}.tar.gz")
md5sums=('3263918e8870bd3bd2b63ad32ff12822')

build() { 
    cd $srcdir/Epson-ALC1100-filter-$pkgver
    ./configure --prefix=/usr --sysconfdir=/etc || return 1
    make DESTDIR=$pkgdir install || return 1

    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    cp EAPL.en.txt $pkgdir/usr/share/licenses/$pkgname
    cp EAPL.ja.txt $pkgdir/usr/share/licenses/$pkgname
}

