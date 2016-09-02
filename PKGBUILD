# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: ava1ar <mail@ava1ar.me>
# Contributor: Duong Pham <dthpham@gmail.com>
# Contributor: Eric Quackenbush <mail@ericquackenbush.com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>

pkgname=intel-opencl
_pkgver=2.0-54425
_package="intel-opencl-2.0-$_pkgver"
_package_internal="intel-opencl-r${_pkgver}.x86_64"
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="OpenCL(TM) 2.0 Driver for Intel(R) HD, Iris(TM), and Iris(TM) Pro Graphics for Linux"
arch=('x86_64')
url="https://software.intel.com/en-us/articles/opencl-drivers#latest_linux_driver"
license=('custom:intel')
depends=('zlib' 'libdrm')
optdepends=('intel-opencl-sdk: Intel SDK for OpenCL Applications')
provides=('opencl')
source=(http://registrationcenter-download.intel.com/akdlm/irc_nas/9418/${_package}.tar.gz)
sha256sums=('df2292415a6ead0bd9e9a038e29cea7ec8de70dd1ea00a8aa190bacb174803e6')

package() {
	cd $_package

	tar -xf ${_package_internal}.tar.xz -C "$pkgdir"

	# Copy license
	mkdir -p                              "$pkgdir/usr/share/licenses/intel-opencl"
	mv "$pkgdir/opt/intel/opencl/LICENSE" "$pkgdir/usr/share/licenses/intel-opencl/LICENSE"

	# Do not conflict with intel-opencl-runtime
	mv "$pkgdir/etc/OpenCL/vendors/intel"{,-gpu}.icd

	# sanitize permissions
	chown root:root -R "$pkgdir"
	chmod go-w -R "$pkgdir"
}
