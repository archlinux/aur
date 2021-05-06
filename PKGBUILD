# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-compiler-dpcpp-cpp
pkgver=2021.2.0
_debpkgrel=610
pkgrel=1
pkgdesc="Intel® oneAPI DPC++/C++ Compiler"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=(
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname/-compiler/}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-common-${pkgver}-${pkgver}-${_debpkgrel}_all.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-runtime-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname%cpp}eclipse-cfg-${pkgver}-${_debpkgrel}_all.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname/-dpcpp/}-eclipse-cfg-${pkgver}-${_debpkgrel}_all.deb"
)
noextract=(
	"${pkgname/-compiler/}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}-common-${pkgver}-${pkgver}-${_debpkgrel}_all.deb"
	"${pkgname}-runtime-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname%cpp}eclipse-cfg-${pkgver}-${_debpkgrel}_all.deb"
	"${pkgname/-dpcpp/}-eclipse-cfg-${pkgver}-${_debpkgrel}_all.deb"
)
sha256sums=('730273ae28c0623fb3720c27c6681e90191bc51d8b3f6ab6713ee5afe6779a5f'
            '3c199045a65b5f382f24424ef983aaa3f4012a961f58a71fa99e68d8a855fa6f'
            '3588eacc7f16181793bc2fe91b7386d6affedc3b501fd830058772f0cc16a65b'
            '9ff1898c0861dca0146094ccb644496c94d13ed61e4d7ce121fc295854ebecf5'
            '21651b1d5d5f24c3bc7ef9ac99cc04f5464ea8e6189611f95a71cae10169e549')

build() {
	ar x ${pkgname/-compiler/}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-common-${pkgver}-${pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-runtime-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname%cpp}eclipse-cfg-${pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz

	ar x ${pkgname/-dpcpp/}-eclipse-cfg-${pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz
}

package() {
	depends=(
		'intel-oneapi-tbb'
		'intel-oneapi-libdpstd'
		'intel-oneapi-dev-utilities'
		'intel-oneapi-compiler-shared'
		'intel-oneapi-common-vars'
		'intel-oneapi-common-licensing'
	)
	mv ${srcdir}/opt ${pkgdir}
}
