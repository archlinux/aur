# Maintainer: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=vlfeat
pkgver=0.9.21
pkgrel=1
pkgdesc='An open source library of popular computer vision algorithms specializing in image understanding and local features extraction and matching'
arch=('x86' 'x86_64')
url='http://www.vlfeat.org'
license=('BSD')
source=("https://github.com/vlfeat/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('221d7fb5103f004cc90201307fd1acb080c0caf5c2c26435ba1d5307c07e8cce')
sha512sums=('ba7f83392d778a4a8c121aed10ae98693d8d61ae127e627322324c245cd1984ab8c0c3e3afe743075e7c022b3efb78e7dfc653bc488c8f19c93b3aa0f87e803e')

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
