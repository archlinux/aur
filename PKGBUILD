_pkgbase=libc++
pkgnase=${_pkgbase}-rpm
pkgname=(${_pkgbase}{,abi}-rpm)
pkgver=7.0.0
pkgrel=1
url="https://libcxx.llvm.org/"
license=('MIT' 'custom:University of Illinois/NCSA Open Source License')
arch=('x86_64')
depends=('gcc-libs')
source=(
"https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/$arch/os/Packages/l/libcxx-$pkgver-$pkgrel.fc30.$arch.rpm"
"https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/$arch/os/Packages/l/libcxx-devel-$pkgver-$pkgrel.fc30.$arch.rpm"
"https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/$arch/os/Packages/l/libcxxabi-$pkgver-$pkgrel.fc30.$arch.rpm"
"https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/$arch/os/Packages/l/libcxxabi-devel-$pkgver-$pkgrel.fc30.$arch.rpm"
)
noextract=("${source[@]##*/}")
sha256sums=(
'3726f6705ba9c6ebb2e99865a4fadcc97b695f56ec11e2613208c698df33e0f5'
'eb619542d06b774670d2bc06b67d86ddcb3b706a1e2091fd08b9128f4b1cc0d3'
'8575d56cc65944fc9baff708246ee8b6cb7bdc4a98b6e2108d7ec6f69828b94d'
'0baae7fe03f6734ad5bae35a3b108eed11f22d3c28c27990d8f0a84629e8628b'
)
 
package_libc++-rpm() {
  pkgdesc='LLVM C++ standard library. (from Fedora rawhide)'
  depends=("libc++abi=${pkgver}-${pkgrel}")
  conflicts=('libc++')
  provices=('libc++')
  cd "${pkgdir}"
  bsdtar -x -p -f "${srcdir}/libcxx-$pkgver-$pkgrel.fc30.$arch.rpm"
  bsdtar -x -p -f "${srcdir}/libcxx-devel-$pkgver-$pkgrel.fc30.$arch.rpm"

  cd usr
  rm -rf lib
  mv lib64 lib
}
 
package_libc++abi-rpm() {
  pkgdesc='Low level support for the LLVM C++ standard library. (from Fedora rawhide)'
  conflicts=('libc++abi')
  provides=('libc++abi')
  cd "${pkgdir}"
  bsdtar -x -p -f "${srcdir}/libcxxabi-$pkgver-$pkgrel.fc30.$arch.rpm"
  bsdtar -x -p -f "${srcdir}/libcxxabi-devel-$pkgver-$pkgrel.fc30.$arch.rpm"

  cd usr
  rm -rf lib
  mv lib64 lib
}
 
