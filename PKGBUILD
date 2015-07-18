# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>
pkgname=qarte
pkgver=2.3.0
pkgrel=4
pkgdesc='Allow you to browse into the archive of arte+7 & arteLiveWeb sites and to record your prefered videos.'
url='https://launchpad.net/qarte'
arch=('i686' 'x86_64')
license=('GPL3')
source=(http://ppa.launchpad.net/vincent-vandevyvre/vvv/ubuntu/pool/main/q/qarte/${pkgname}_${pkgver}.orig.tar.gz)
depends=('python2-pyqt4' 'python2-notify' 'rtmpdump')
optdepends=('cronie: for differed download')
md5sums=('f978a1d5e7ee89e4d3af3ac7d2747b6f')

package() {
	cd $srcdir/${pkgver}

	# Python2 fix
	sed -i 's_python_python2_' qarte
	sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' qarte.py

	# For crontab
	sed -i "/.replace('<root>', root)/ s/.*/                                    .replace('python', 'python2')\\\\\n&/" differedTask.py

	# Man compression
	gzip qarte.1

	bin_dir="$pkgdir/usr/bin"
	doc_dir="$pkgdir/usr/share/doc/${pkgname}-${pkgver}"
	man_dir="$pkgdir/usr/share/man/man1"
	application_dir="$pkgdir/usr/share/applications"
	pixmaps_dir="$pkgdir/usr/share/pixmaps"
	qarte_dir="$pkgdir/usr/share/${pkgname}"

	mkdir -p $bin_dir
	mkdir -p $doc_dir
	mkdir -p $man_dir
	mkdir -p $application_dir
	mkdir -p $pixmaps_dir
	mkdir -p $qarte_dir

	mv qarte $bin_dir
	mv README $doc_dir
	mv qarte.1.gz $man_dir
	mv q_arte.desktop $application_dir
	mv qarte.png $pixmaps_dir
	chmod 0644 $pixmaps_dir/qarte.png
	mv * $qarte_dir
}
