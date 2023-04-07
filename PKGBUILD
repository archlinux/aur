# Maintainer: batot <archpackager@algrim.pl>
# Contributor: nick black <dankamongmen@gmail.com>
# Contributor: ava1ar <maiL@ava1ar.me>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Nicolas Bigaouette <nbigaouette@gmail.com>
# Contributor: Vojtech "kralyk" Kral

pkgname=intel-opencl-sdk
pkgver=2020.3.494
pkgrel=2
pkgdesc="Intel SDK for OpenCL Applications"
arch=('x86_64')
url="https://software.intel.com/en-us/intel-opencl/download"
license=('custom:intel')
depends=('cpio' 'opencl-icd-loader' 'libpng12' 'opencl-headers')
optdepends=('intel-opencl-runtime: OpenCL runtime for Intel Core and Xeon processors')
source=(https://registrationcenter-download.intel.com/akdlm/IRC_NAS/17205/intel_sdk_for_opencl_applications_${pkgver}.tar.gz)
sha256sums=('75cc2aa08d652e5e2fddca15b9e0026b69794c97f058c19d1c8594fd57804612')

build() {
pwd
  chmod 0755 ../pkg
echo "MAKING: ${pkgdir}/opt/intel"
  mkdir -p "${pkgdir}/opt/intel"
  chmod 0755 "${pkgdir}"
  xdir="${srcdir}/intel_sdk_for_opencl_applications_${pkgver}"
  cd "${xdir}"

         #-e 's/COMPONENTS=.*/COMPONENTS=opencl_cpu_rt_meta/' \
  # prep the silent.cfg file
  sed -i -e 's/ACCEPT_EULA=.*/ACCEPT_EULA=accept/' \
         -e "s#PSET_INSTALL_DIR=\(.*\)#PSET_INSTALL_DIR=${pkgdir}\1#" \
         silent.cfg

  # if run as UID 0 (as package() does), install.sh unconditionally writes to
  # /opt/intel. If run as some other UID (and --user-mode is provided), it'll
  # instead write to $HOME. so we change our UID, and force $HOME.
  # doubleplusugh.
  #export HOME="${pkgdir}"
  ./install.sh -s silent.cfg --ignore-cpu --cli-mode --user-mode
}

package() {
  # FIXME set ownership
  echo "arrrrrr"
}
