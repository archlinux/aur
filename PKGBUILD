# Maintainer: Duong Pham <dthpham@gmail.com>
# Contributor: Eric Quackenbush <mail@ericquackenbush.com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=intel-opencl-runtime
pkgver=2014_R2
pkgrel=3
pkgdesc="Intel's implementation of the OpenCL standard optimized for Intel processors"
arch=('x86_64')
url="http://software.intel.com/en-us/vcsource/tools/opencl"
license=('intel')
depends=('intel-opencl-sdk')
makedepends=('rpmextract')
provides=('opencl')
install='intel-opencl-runtime.install'
source=('http://registrationcenter.intel.com/irc_nas/4181/opencl_runtime_14.2_x64_4.5.0.8.tgz')
sha256sums=('2f89eed6e8e1ebfd7d22ea4a10cfc63cbe8ffb41445d78e98de02f99806d2aac')
_ipath="/opt/intel/opencl-sdk"

package() {
  # Unpack RPM
  cd "${srcdir}"/pset_opencl_runtime_*/
  rm  rpm/opencl-1.2-base-pset-*.rpm
  for i in rpm/*.rpm; do  rpmextract.sh "$i"; done

  # Install files
  mkdir -p "${pkgdir}/${_ipath}"
  rm opt/intel/opencl-*/lib64/opencl_.pch
  cp -r opt/intel/opencl-*/* "${pkgdir}/${_ipath}"
}
