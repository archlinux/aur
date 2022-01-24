# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-dnnl
pkgver=2022.0.2
_debpkgrel=43
pkgrel=1
pkgdesc="Intel® oneAPI Deep Neural Network Library"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${pkgver}-${_debpkgrel}_amd64.deb"
"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-devel-${pkgver}-${_debpkgrel}_amd64.deb"
"${pkgname}.conf")
sha256sums=('a7d855bfad11f23c399bace8bb420c76ebbff9b7d7da89a81739b0d98d727fd3'
            '1b8360e0e2cc8807634c27fcb2c53fa243feec7e97029037fbc0f5c65ac76932'
            'f1fe419d6cbab4411c5fe68515b1fc8f317185b70a0c2b7400ba7c88dbd32c63')

noextract=(
	"${pkgname}-${pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}-devel-${pkgver}-${_debpkgrel}_amd64.deb"
)

build() {
	ar x ${pkgname}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-devel-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz
}

package() {
	depends=('intel-oneapi-common-vars>=2022.0.0' 'intel-oneapi-common-licensing=2022.0.0'
    'intel-oneapi-tbb=2021.5.1' 'intel-oneapi-compiler=2022.0.2' )
	mv ${srcdir}/opt ${pkgdir}
	ln -sfT "$pkgver" ${pkgdir}/opt/intel/oneapi/dnnl/latest

	install -Dm644 ${pkgname}.conf ${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf

	#mkdir -p ${pkgdir}/usr/lib/cmake
	#ln -sfT "/opt/intel/oneapi/dpl/latest/lib/cmake/dnnl" ${pkgdir}/usr/lib/cmake/dnnl
}
