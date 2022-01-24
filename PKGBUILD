# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-ccl
pkgver=2021.5.1
_debpkgrel=494
pkgrel=1
pkgdesc="Intel® oneAPI Collective Communications Library"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=(
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-devel-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}.conf"
)
noextract=(
	"${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}-devel-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
)
sha256sums=('c68b03cbe8f02603511c773125e18d73e48d8ad0c7cd7729d4e42f2691c46edc'
            '2bf53e14d04d775af1d3db3f39cfbdf0a37634fda316ae4a3169d07dc99f0485'
            '711518e543c0b4cd40cda37357936d6c5923da64862f7afa54f673f3daadd065')

build() {
	ar x ${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-devel-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

}

package() {
	depends=('intel-oneapi-common-vars>=2022.0.0' 'intel-oneapi-common-licensing=2022.0.0')
	mv ${srcdir}/opt ${pkgdir}
	ln -sfT "$pkgver" ${pkgdir}/opt/intel/oneapi/ccl/latest

	install -Dm644 ${pkgname}.conf ${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf

	mkdir -p ${pkgdir}/usr/lib/cmake
	ln -sfT "/opt/intel/oneapi/dpl/latest/lib/cmake/oneCCL" ${pkgdir}/usr/lib/cmake/oneCCL
}
