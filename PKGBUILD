# Maintainer: Yngve Levinsen <first name dot last name at ess dot eu>
# Contributor: Grey Christoforo <first name at last name dot net>

pkgname=ess-epics
pkgver=7.0.5
pkgrel=1
pkgdesc="Experimental Physics and Industrial Control System -- ESS falvor"
arch=('any')
url="http://www.aps.anl.gov/epics/"
provides=('epics')
conflicts=('epics')
license=('EPICS Open License')
makedepends=('rpcsvc-proto' 'tree' 'git')
depends=('libtirpc-compat' 'tclx' 'tcl' 'aravis' 'glibmm' 'libtirpc' 'readline' 'libxt' 'libxmu' 'libxpm' 'pcre' 'net-snmp' 're2c' 'darcs' 'python2' 'netcdf' 'hdf5' 'libpng' 'bzip2' 'libxml2' 'libxml2' 'libusb' 'libusb-compat' 'remake' 'systemd' 'linux-headers' 'mercurial' 'boost' 'boost-libs' 'libraw1394' 'opencv')
source=("git+https://gitlab.esss.lu.se/e3/e3.git")
md5sums=('SKIP')

MAKEFLAGS="-j1" # mutithread building breaks this

prepare() {
  cd e3
  bash e3_building_config.bash -y -t "${srcdir}/build" -b ${pkgver} setup
}

build() {
  cd e3
  bash e3.bash base
}

package() {
  cd e3
  
  mkdir -p "${pkgdir}/opt/"
  cp -a "${srcdir}/build/base-${pkgver}" "${pkgdir}/opt/ess-epics"
}
