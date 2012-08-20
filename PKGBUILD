# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=pqp
pkgver=1.3
pkgrel=1
pkgdesc="A library for performing proximity queries on a pair of geometric models composed of triangles"
arch=('i686' 'x86_64')
url="http://gamma.cs.unc.edu/SSV/"
license=('Custom')
depends=()
source=(http://gamma.cs.unc.edu/software/downloads/SSV/${pkgname}-${pkgver}.tar.gz
		LICENSE
		fpic.patch)
md5sums=('f710e24a62db763d61d08667439d46fd'
		 'a84efad9de33fd28444fa14f9bd7d273'
		 '4bc614687ef5b95df3b9be31ca46c662')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/PQP_v1.3"
	
	patch -p2 < ${srcdir}/fpic.patch
	
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/PQP_v1.3"
	
	install -dm755 "${pkgdir}/usr/include/"
	install -dm755 "${pkgdir}/usr/lib/"
	
	install include/* "${pkgdir}/usr/include/"
	install lib/libPQP.a "${pkgdir}/usr/lib/"
	
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

