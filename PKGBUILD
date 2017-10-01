# Maintainer: Ilya Oshchepkov 
pkgname=glab
pkgver=5.0.0
pkgrel=1
pkgdesc="Interactive educational multipurpose package to process and analyse GNSS data"
arch=(i686 x86_64)
url="http://gage.upc.edu/drupal6/gLAB"
license=('Apache')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-basemap' 'tk')
source=($pkgname.tgz::http://gage.upc.edu/sites/default/files/gLAB/src/LINUX/gLAB_$pkgver\_Linux.tgz)
noextract=($pkgname.tgz)
md5sums=('4d9b0132b0b100e79455d273410f6792')

build() {
    tar -xf $pkgname.tgz
    mv "$srcdir"/gLAB "$srcdir/$pkgname" 
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"

    install -dm755 "$pkgdir"/usr/bin/
    install -m755 gLAB_linux "$pkgdir"/usr/bin/gLAB_linux
    install -m755 graph.py "$pkgdir"/usr/bin/graph.py
    install -m755 gLAB_GUI "$pkgdir"/usr/bin/glab

    install -dm755 "$pkgdir"/usr/share/gLAB

    # move docs
    install *.pdf "$pkgdir"/usr/share/gLAB/ 
}
