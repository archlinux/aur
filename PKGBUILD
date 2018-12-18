# Maintainer: Ilya Oshchepkov 
pkgname=glab
pkgver=5.4.0
pkgrel=1
pkgdesc="Interactive educational multipurpose package to process and analyse GNSS data"
arch=(x86_64)
url="http://gage.upc.edu/drupal6/gLAB"
license=('Apache')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-basemap' 'tk')
source=($pkgname.tgz::http://gage.upc.edu/sites/default/files/gLAB/src/LINUX/gLAB_$pkgver\_Linux.tgz)
noextract=($pkgname.tgz)
md5sums=('54ec9df8f9a6a67da42b1d1cdafe6596')

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
    install -m755 gLAB_GUI_64 "$pkgdir"/usr/bin/glab

    install -dm755 "$pkgdir"/usr/share/gLAB

    # move docs
    install *.pdf "$pkgdir"/usr/share/gLAB/ 
}
