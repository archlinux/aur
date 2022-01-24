# Contributor : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-ipp
pkgver=2021.5.2
_debpkgrel=544
pkgrel=1
pkgdesc="Intel® Integrated Performance Primitives"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=(
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-devel-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-common-${pkgver}-${pkgver}-${_debpkgrel}_all.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-common-devel-${pkgver}-${pkgver}-${_debpkgrel}_all.deb"
	"${pkgname}.conf"
)
noextract=(
	"${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}-devel-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}-common-${pkgver}-${pkgver}-${_debpkgrel}_all.deb"
	"${pkgname}-common-devel-${pkgver}-${pkgver}-${_debpkgrel}_all.deb"
)
sha256sums=('19020402a758e73c53791d0b56669b3b37663ea5ce5a53de91b929e0c60c40fb'
            'bfba9918763d6fa4412d9d6672caf0470ed5e46e7b7540b28602ad903a8fb922'
            'fd0c2017b726e9b8f24d945a8c4d1240798dc47f0d210962fa846e0e78069572'
            '926a1a514b66829f2750ea87032076967fc8db0a38facd84e489d2d32d25ff3c'
            'a323ca2483f6ef07422fb19798447ac7ca43d59b5f42aa47710ec940eb2bbaff')

build() {
	ar x ${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-devel-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-common-${pkgver}-${pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-common-devel-${pkgver}-${pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz

	rm -r opt/intel/oneapi/conda_channel
}

package() {
	depends=('intel-oneapi-common-vars>=2022.0.0' 'intel-oneapi-common-licensing=2022.0.0'
    'intel-oneapi-tbb=2021.5.1' 'intel-oneapi-compiler=2022.0.2')
	mv ${srcdir}/opt ${pkgdir}
	ln -sfT "$pkgver" ${pkgdir}/opt/intel/oneapi/ipp/latest

	install -Dm644 ${pkgname}.conf ${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf
}
