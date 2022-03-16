# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgbase=intel-oneapi-vtune
pkgname=(intel-oneapi-vtune intel-oneapi-vtune-static)
_pkgver=2022.1.0
_debpkgrel=98
pkgver=${_pkgver}_${_debpkgrel}
pkgrel=1
pkgdesc="Intel® VTune(TM) Profiler"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=("https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-vtune-${_pkgver}-${_debpkgrel}_amd64.deb")
sha256sums=('4e91aa1e233ecf62208941e367386733715d63e269fcec789fb9cf7ceb51fafe')

build() {
	tar xvf data.tar.xz
}

package_intel-oneapi-vtune() {
	depends=('intel-oneapi-common-vars>=2022.0.0' 'intel-oneapi-common-licensing=2022.0.0')
	cp -r ${srcdir}/opt ${pkgdir}
	ln -sfT "$_pkgver" ${pkgdir}/opt/intel/oneapi/vtune/latest
}

package_intel-oneapi-vtune-static() {
	pkgdesc="$pkgdesc (static libs)"
	depends=("$pkgbase=$pkgver")
	options=(staticlibs)
	cd ${srcdir}
	for _file in $(find . -name '*.a'); do
		_filename=$(echo $_file | sed "s/.a$//g")
		if [ -f "$_filename.so" ]; then
			cp --parents ${_file} ${pkgdir}/
		fi
	done
}
