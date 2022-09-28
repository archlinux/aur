# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=intel-cpu-runtime
_pkgver=2021.7.0
pkgver=2022.2.0
_pkgrel=8712
pkgrel=8734
pkgdesc="Intel(R) CPU Runtime for OpenCL(TM) Applications"
arch=('x86_64')
url="https://software.intel.com/content/www/us/en/develop/articles/opencl-runtime-release-notes.html"
license=('custom')
depends=('tbb' 'hwloc')
provides=('opencl-intel' 'opencl-driver')
source=(
  "https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-runtime-tbb-${_pkgver}-${_pkgrel}_amd64.deb"
  "https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-runtime-opencl-${pkgver}-${pkgrel}_amd64.deb"
)
sha256sums=(
  'SKIP'
  'SKIP'
)
noextract=("${source[@]##*/}")

package() {
  cd "$srcdir"

  ar x "intel-oneapi-runtime-tbb-${_pkgver}-${_pkgrel}_amd64.deb"
  tar -xf data.tar.xz -C "$pkgdir/"

  ar x "intel-oneapi-runtime-opencl-${pkgver}-${pkgrel}_amd64.deb"
  tar -xf data.tar.xz -C "$pkgdir/"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  cp "$pkgdir/opt/intel/oneapi/lib/licensing/opencl/"* "$pkgdir/usr/share/licenses/$pkgname/"

  install -dm755 "$pkgdir/etc/OpenCL/vendors"
  echo '/opt/intel/oneapi/lib/intel64/libintelocl.so' > "$pkgdir/etc/OpenCL/vendors/intel64.icd"

  rm -rf "$pkgdir/opt/intel/oneapi/lib/etc"
  rm -rf "$pkgdir/opt/intel/oneapi/lib/licensing"
}
