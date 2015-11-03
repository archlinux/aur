#Maintainer: Daniel Gerbaudo <info@danielgerbaudo.com>
#Reuploaded Stephen Zhang's package.
#Fixed dependencies

pkgname=procexp
pkgver=1.7.289
pkgrel=1
pkgdesc="Graphical process explorer for Linux."
arch=('any')
url="http://sourceforge.net/projects/procexp/"
license=('GPL2')
depends=('util-linux' 'python2-pyqwt' 'python2' 'python2-pyqt4' 'python2-configobj' 'tcpdump' 'polkit')
optdepends=('ethtool: obtain ethernet cards statistics')
options=(docs)
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/${pkgname}/bin_v1/${pkgname}_${pkgver}-0ubuntu1_all.deb")
md5sums=("5ce96fd6a5772f4e371ab863f032450f")
package() {
	cd $srcdir
	tar -zxvf data.tar.gz
	sed -e '20s#python#/usr/bin/python2.7#' $srcdir/usr/bin/procexp.sh > $srcdir/usr/bin/procexp
	rm $srcdir/usr/bin/procexp.sh
	
	sed -i -e '5s/.sh//' $srcdir/usr/share/applications/procexp.desktop

	chmod a+x $srcdir/usr/bin/procexp

	cp -dpr --no-preserve=ownership $srcdir/usr/ $pkgdir/
	chmod a+x $pkgdir/usr/lib/procexp/rootproxy/procroot.py
}

