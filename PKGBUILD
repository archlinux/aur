
# Maintainer: Luca Fulchir <luker at fenrirproject.org>

pkgname=lparse
pkgver=1.1.2
pkgrel=1
pkgdesc="Lparse is a front-end to smodels that generates a variable-free simple logic"
arch=('i686' 'x86_64')
url="http://www.tcs.hut.fi/Software/smodels/"
license=('GPL2')
source=(http://www.tcs.hut.fi/Software/smodels/src/${pkgname}-${pkgver}.tar.gz)
sha1sums=('c7d4bae84e37066e221f44c17b4df120f511bd14')
sha256sums=('886d29723f7188296e48584a4a32b8f111414acb7ca8490af28ef6b7f1717298')

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"

    # There is this little bug that...
    cd src
    for file in $(\ls *cc); do
        sed -i 's/^\([\ ]*\)runtime_error/\1::runtime_error/' $file
    done
    cd ..
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"

	./configure	--prefix=/usr
	make
    cd lib
    make
    cd ..
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p ${pkgdir}/usr/{bin,lib,share/doc/${pkgname}}
    cp src/lparse ${pkgdir}/usr/bin/
    cp lib/liblparse.so ${pkgdir}/usr/lib/
    cp -a examples ${pkgdir}/usr/share/doc/${pkgname}/
    cp doc/lparse.ps ${pkgdir}/usr/share/doc/${pkgname}/
}



