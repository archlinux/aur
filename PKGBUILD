# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=intel-cpu-runtime
pkgver=18.1.0.015
pkgrel=1
pkgdesc="Intel(R) CPU Runtime for OpenCL(TM) Applications"
arch=('x86_64')
url="https://software.intel.com/content/www/us/en/develop/articles/opencl-drivers.html#cpu-section"
license=('custom')
depends=('libxml2' 'numactl' 'tbb' 'ncurses5-compat-libs')
provides=('opencl-intel' 'opencl-driver')
source=("https://registrationcenter-download.intel.com/akdlm/irc_nas/vcp/15532/l_opencl_p_$pkgver.tgz")
sha512sums=('8c00163df272fd6e93c249501b06e4c1de0c994c8e23426705a1c6dc4131fb06e691e98962455f386b26cbf3a21fff3042d6f1a783b97433aa5a7951c007bb36')

package() {
  cd "$srcdir/l_opencl_p_$pkgver"
  bsdtar -xf "rpm/intel-openclrt-$pkgver-"*.rpm

  mkdir -p "$pkgdir/opt"
  mv "opt/intel/opencl_compilers_and_libraries_$pkgver" "$pkgdir/opt/intel-cpu-runtime"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /opt/intel-cpu-runtime/licensing/* "$pkgdir/usr/share/licenses/$pkgname/"

  mkdir -p "$pkgdir/etc/OpenCL/vendors"
  sed -i 's|<INSTALLDIR>|/opt/intel-cpu-runtime|g' "$pkgdir/opt/intel-cpu-runtime/linux/etc/intel64.icd"
  ln -s /opt/intel-cpu-runtime/linux/etc/intel64.icd "$pkgdir/etc/OpenCL/vendors/intel64.icd"
}
