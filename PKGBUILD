# Maintainer: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=vlfeat
pkgver=0.9.20
pkgrel=1
pkgdesc='An open source library of popular computer vision algorithms specializing in image understanding and local features extraction and matching'
arch=('x86' 'x86_64')
url='http://www.vlfeat.org'
license=('BSD')
source=("https://github.com/vlfeat/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d85945b05b782d612bd5208fdbc2d9f74ef2dcf138a17ad8ffc9864edb79ff54')

build() {
	cd "$pkgname-$pkgver"
	make MEX=
	gzip -f src/sift.1
	gzip -f src/mser.1
	gzip -f src/vlfeat.7
}

package() {
	if [ $CARCH = 'x86' ]; then
		local builddir='bin/glnx86'
	else
		local builddir='bin/glnxa64'
	fi
	cd "$pkgname-$pkgver"

	install -D -m755 "$builddir"/sift "$pkgdir"/usr/bin/sift
	install -D -m644 src/sift.1.gz "$pkgdir"/usr/share/man/man1/sift.1.gz
	install -D -m755 "$builddir"/mser "$pkgdir"/usr/bin/mser
	install -D -m644 src/mser.1.gz "$pkgdir"/usr/share/man/man1/mser.1.gz
	install -D -m755 "$builddir"/libvl.so "$pkgdir"/usr/lib/libvl.so
	install -D -m644 src/vlfeat.7.gz "$pkgdir"/usr/share/man/man7/vlfeat.7.gz
	install -d -m755 "$pkgdir"/usr/include/vl
	install -m644 vl/*.h "$pkgdir"/usr/include/vl
	install -D -m644 COPYING "$pkgdir"/usr/share/licenses/vlfeat/COPYING
}
