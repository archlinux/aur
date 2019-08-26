# Maintainer: Jane 'polaris' Doe <polarisfm at disroot dot org>

pkgname=libnorm1
pkgver=1.5.8
pkgrel=1
pkgdesc="libnorm1 built from source"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://www.nrl.navy.mil/itd/ncs/products/norm"
license=('custom')
depends=('libstdc++5' 'glibc' 'gcc')
provides=('libnorm1')
source=("https://downloads.pf.itd.nrl.navy.mil/norm/src-norm-${pkgver}.tgz")
sha256sums=('4480a6ea53fb7ce45b4bc2061d18fbfd46ee9990fc2ed9a9dc303ce4d87888a6')

package() {
	cd "$srcdir/"
	tar -xf src-norm-${pkgver}.tgz
	cd ${srcdir}/norm-1.5.8/
	python2 waf
	DESTDIR="${pkgdir}" python2 waf install
	mkdir ${pkgdir}/usr/lib/
	ln -s ${pkgdir}/usr/local/lib/libnorm.so ${pkgdir}/usr/lib/
        ln -s ${pkgdir}/usr/local/lib/libnorm.so.1 ${pkgdir}/usr/lib/
        ln -s ${pkgdir}/usr/local/lib/libnorm.so${pkgver} ${pkgdir}/usr/lib/
}
