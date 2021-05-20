# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-dev-utilities
pkgver=2021.2.0
_debpkgrel=493
pkgrel=1
pkgdesc="Intel oneAPI Dev Utilities"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=(
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-eclipse-cfg-${pkgver}-${_debpkgrel}_all.deb"
)
noextract=(
	"${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb"
	"${pkgname}-eclipse-cfg-${pkgver}-${_debpkgrel}_all.deb"
)
sha256sums=('04c65df18a134478da7ff7ce4cd1caa0a0d7fac53aa39219b9b136450fffd72c'
            'fc2016d15d75e8f16929c6e985f762503884f2faeb148034069b60eb0e37c4ff')

build() {
	ar x ${pkgname}-${pkgver}-${pkgver}-${_debpkgrel}_amd64.deb
	tar xvf data.tar.xz

	ar x ${pkgname}-eclipse-cfg-${pkgver}-${_debpkgrel}_all.deb
	tar xvf data.tar.xz
}

package() {
	depends=('intel-oneapi-common-vars' 'intel-oneapi-common-licensing')
	mv ${srcdir}/opt ${pkgdir}
	ln -sfT "$pkgver" ${pkgdir}/opt/intel/oneapi/dev-utilities/latest
}
