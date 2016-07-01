# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: ava1ar <mail@ava1ar.me>
# Contributor: Duong Pham <dthpham@gmail.com>
# Contributor: Eric Quackenbush <mail@ericquackenbush.com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

pkgname=intel-opencl
_pkgver=1.0-47971
_package="intel-opencl-1.2-$_pkgver"
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="OpenCL(TM) 1.2 Driver for Intel(R) HD, Iris(TM), and Iris(TM) Pro Graphics for Linux"
arch=('x86_64')
url="https://software.intel.com/en-us/articles/opencl-drivers#latest_linux_driver"
license=('custom:intel')
depends=('zlib' 'libdrm')
optdepends=('intel-opencl-sdk: Intel SDK for OpenCL Applications')
provides=('opencl')
source=(https://software.intel.com/sites/default/files/managed/ee/1f/${_package}.tar.gz)
sha256sums=('4c4ebf32d591727f4f0fe02e3b0989e70988cff24ae195eb626d38f2c5ad296f')

package() {
	cd $_package

	tar -xf ${_package}.x86_64.tar.gz -C "$pkgdir"

	# Copy license
	mkdir -p                              "$pkgdir/usr/share/licenses/intel-opencl"
	mv "$pkgdir/opt/intel/opencl/LICENSE" "$pkgdir/usr/share/licenses/intel-opencl/LICENSE"

	# Do not conflict with intel-opencl-runtime
	mv "$pkgdir/etc/OpenCL/vendors/intel"{,-gpu}.icd

	# sanitize permissions
	chown root:root -R "$pkgdir"
	chmod go-w -R "$pkgdir"
}
