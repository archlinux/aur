# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-tbb
_pkgver=2021.5.1
_debpkgrel=738
pkgver=${_pkgver}_${_debpkgrel}
pkgrel=1
pkgdesc="Intel® oneAPI Threading Building Blocks"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=(
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${_pkgver}-${_pkgver}-${_debpkgrel}_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-devel-${_pkgver}-${_pkgver}-${_debpkgrel}_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-common-${_pkgver}-${_pkgver}-${_debpkgrel}_all.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-common-devel-${_pkgver}-${_pkgver}-${_debpkgrel}_all.deb"
	"${pkgname}.conf"
)
noextract=(
	"${pkgname}-${_pkgver}-${_pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}-devel-${_pkgver}-${_pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}-common-${_pkgver}-${_pkgver}-${_debpkgrel}_all.deb"
	"${pkgname}-common-devel-${_pkgver}-${_pkgver}-${_debpkgrel}_all.deb"
)
sha256sums=('bbc3bcb009cf9025a1b84ad73209e3f48b67935c32980b4d6acc0a2a4893c02c'
            'ac9452385fc8024bdb8df5343d7ebd587b12702ca0d5e562535f310c1027a53e'
            '64c131d70b0a51bd2a1188e6a9dc347680508196d41346e05ce6ec3a11370ce5'
            '3bf7d565766deaeac87b5fce87f14d1df1e4a789b2385747dde5d087ce1e0234'
            'ab4d154371df8bf81c4fd8f079137994c5c9a60f43bef4132e6ffcbfbb08e99d')

build() {
	ar x ${pkgname}-${_pkgver}-${_pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-devel-${_pkgver}-${_pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-common-${_pkgver}-${_pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-common-devel-${_pkgver}-${_pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz

	rm -r opt/intel/oneapi/conda_channel
}

package() {
	depends=('intel-oneapi-common-vars>=2022.0.0' 'intel-oneapi-common-licensing=2022.0.0')
	cp -r ${srcdir}/opt ${pkgdir}
	ln -sfT "$_pkgver" ${pkgdir}/opt/intel/oneapi/tbb/latest

	install -Dm644 ${pkgname}.conf ${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf
}


