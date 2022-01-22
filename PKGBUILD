# Maintainer: Diego Roux <diegoroux04 AT protonmail DOT com>

pkgname=vstar
pkgver=2.21.3
pkgrel=1
pkgdesc="A visualisation and analysis tool for variable star obsevation data"
arch=('any')
url="https://www.aavso.org/vstar"
license=('AGPL3')
depends=('java-runtime>=1.8')
source=("https://github.com/AAVSO/VStar/releases/download/${pkgver}/vstar-bash-${pkgver}.zip"
		vstar.desktop
		vstar.sh)
sha256sums=('20cee3f9a22f9b9c3d04738f7717200b0e6748592ceec122a480cb88783a106c'
            '2bc61bcf9c10f71d20795cc4befa69ead05d4addfd4ca28b694b05d9a53f5d08'
            '73f2d8fe79a14cd0b76f868bb622845eae440b297a8056c07fcd72cc340530ed')

package() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/${pkgname}
	mkdir -p ${pkgdir}/usr/share/pixmaps/
	mkdir -p ${pkgdir}/usr/share/applications/
	mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

	cd ${srcdir}

	install -m644 vstar.desktop ${pkgdir}/usr/share/applications/
	install -m755 vstar.sh ${pkgdir}/usr/bin/${pkgname}

	cd ${pkgname}

	install -m644 extlib/vstaricon.png ${pkgdir}/usr/share/pixmaps/vstar.png

	cp -r {data,dist,extlib}/ ${pkgdir}/usr/share/${pkgname}/
	cp -r doc/vstar_docs/* ${pkgdir}/usr/share/doc/${pkgname}/
	cp doc/*.{pdf,png} ${pkgdir}/usr/share/doc/${pkgname}/
	cp doc/license/* ${pkgdir}/usr/share/licenses/${pkgname}/
}
