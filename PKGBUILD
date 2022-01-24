# Contributor : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-dal
pkgver=2021.5.1
_debpkgrel=803
pkgrel=1
pkgdesc="Intel® oneAPI Data Analytics Library"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=(
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-devel-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-common-${pkgver}-${pkgver}-${_debpkgrel}_all.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-common-devel-${pkgver}-${pkgver}-${_debpkgrel}_all.deb"
    "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-daal4py-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
    "https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-scikit-learn-intelex-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}.conf"
)
noextract=(
	"${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}-devel-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}-common-${pkgver}-${pkgver}-${_debpkgrel}_all.deb"
	"${pkgname}-common-devel-${pkgver}-${pkgver}-${_debpkgrel}_all.deb"
    "${pkgname}-daal4py-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
    "${pkgname}-scikit-learn-intelex-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
)
sha256sums=('0da79eba2cc7f90a8342c6cc5f8109b98c193d9001c69c6528683b9b97344d2f'
            'db375f3dd4fa4acc099dcde1ebd79c1956eebe89b8319d3a4ced2661a4dc0649'
            'dfd0b9e5d55377044b02e1148fedc0a7e9c28ca0a2eb61540dc6268c2fae61f5'
            '1960b604b84764ad5d93214579c0eacd793498bc22110c4ddcbd132fcbb5056c'
            '20da35b16fde0694c784c06ffe582946224ba313f85895ff7d8c20fd734feb66'
            '757c132534363486a932247bdde1385c299ef64644018cb16acdc25cd58d11ec'
            '3bb0049f5245c836472bdb977106ad9fb706d2d04d2544c49c11839d01361cbf')

build() {
	ar x ${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-devel-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-common-${pkgver}-${pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-common-devel-${pkgver}-${pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz

    ar x ${pkgname}-daal4py-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
    tar xvf data.tar.xz

    ar x ${pkgname}-scikit-learn-intelex-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
    tar xvf data.tar.xz

	rm -r opt/intel/oneapi/conda_channel
}

package() {
	depends=('intel-oneapi-common-vars>=2022.0.0' 'intel-oneapi-common-licensing=2022.0.0'
    'intel-oneapi-tbb>=2021.5.0' 'intel-oneapi-compiler>=2022.0.1')
	mv ${srcdir}/opt ${pkgdir}
	ln -sfT "$pkgver" ${pkgdir}/opt/intel/oneapi/dal/latest

	install -Dm644 ${pkgname}.conf ${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf
}
