_pkgbase=libc++
_fedorabaseurl="https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything"
_fedorapackageurl="os/Packages/l"
_fedorarelease="fc30"
_fedoracxxpkgrel=1
_fedoracxxabipkgrel=2
pkgbase=${_pkgbase}-rpm
pkgname=(${_pkgbase}{,abi}-rpm)
pkgver=7.0.0
pkgrel=1
url="https://libcxx.llvm.org/"
license=('MIT' 'custom:University of Illinois/NCSA Open Source License')
arch=('x86_64' 'armv7h' 'aarch64')
depends=('gcc-libs')
noextract=("${source[@]##*/}")
source_x86_64=(
"$_fedorabaseurl/x86_64/$_fedorapackageurl/libcxx-$pkgver-$_fedoracxxpkgrel.$_fedorarelease.x86_64.rpm"
"$_fedorabaseurl/x86_64/$_fedorapackageurl/libcxx-devel-$pkgver-$_fedoracxxpkgrel.$_fedorarelease.x86_64.rpm"
"$_fedorabaseurl/x86_64/$_fedorapackageurl/libcxxabi-$pkgver-$_fedoracxxabipkgrel.$_fedorarelease.x86_64.rpm"
"$_fedorabaseurl/x86_64/$_fedorapackageurl/libcxxabi-devel-$pkgver-$_fedoracxxabipkgrel.$_fedorarelease.x86_64.rpm"
)
sha256sums_x86_64=(
'3726f6705ba9c6ebb2e99865a4fadcc97b695f56ec11e2613208c698df33e0f5'
'eb619542d06b774670d2bc06b67d86ddcb3b706a1e2091fd08b9128f4b1cc0d3'
'05ab7a92ca3cb0ca402b5cafb3bd5c961f7de04e893f6a746d6f686a90b9c76b'
'4870701fb6dda6282a00992054af361f9ee83de7d73d8ae8b1df9298e902c067'
)
source_armv7h=(
"$_fedorabaseurl/armhfp/$_fedorapackageurl/libcxx-$pkgver-$_fedoracxxpkgrel.$_fedorarelease.armv7hl.rpm"
"$_fedorabaseurl/armhfp/$_fedorapackageurl/libcxx-devel-$pkgver-$_fedoracxxpkgrel.$_fedorarelease.armv7hl.rpm"
"$_fedorabaseurl/armhfp/$_fedorapackageurl/libcxxabi-$pkgver-$_fedoracxxabipkgrel.$_fedorarelease.armv7hl.rpm"
"$_fedorabaseurl/armhfp/$_fedorapackageurl/libcxxabi-devel-$pkgver-$_fedoracxxabipkgrel.$_fedorarelease.armv7hl.rpm"
)
sha256sums_armv7h=(
'cac30f4c46b07b306589d67978e69718920aca952ad97af76a131d3cd3466f32'
'4fb5e3b013f45578f23a27d238f46bdb18315701d43732463eac1df37090c337'
'b75a78c71f4412c2dd19a49896065a1c03d3dab37f43bb21c63ce7a7d99dda31'
'dfb38f1a1e511db42cf907f5de153d95a3551a4d635ff2f59b90cca1ef5857ed'
)
source_aarch64=(
"$_fedorabaseurl/aarch64/$_fedorapackageurl/libcxx-$pkgver-$_fedoracxxpkgrel.$_fedorarelease.aarch64.rpm"
"$_fedorabaseurl/aarch64/$_fedorapackageurl/libcxx-devel-$pkgver-$_fedoracxxpkgrel.$_fedorarelease.aarch64.rpm"
"$_fedorabaseurl/aarch64/$_fedorapackageurl/libcxxabi-$pkgver-$_fedoracxxabipkgrel.$_fedorarelease.aarch64.rpm"
"$_fedorabaseurl/aarch64/$_fedorapackageurl/libcxxabi-devel-$pkgver-$_fedoracxxabipkgrel.$_fedorarelease.aarch64.rpm"
)
sha256sums_aarch64=(
'4eda497a7f5b4cd9ee601783000abe93ae8dee890230080624f1d5922d5e0572'
'0ca0149cad539d314bb3b92098974ff9fde1441b23fb5dc103d3aa0ab283675a'
'54aeaca75d0f9cbd5e1c6d64ffc99cc6d4ea2f725638202ca314f82c423d30e7'
'97f424736100f6084d377a864a737230771db882fc7f885568603295baa96f72'
)

package_libc++-rpm() {
  _ARCH=""

  # Update the architecture name based on the current one running this PKGBUILD
  if [ "$CARCH" == "armv7h" ]; then
    _ARCH="armv7hl"
  else
    _ARCH="$CARCH"
  fi

  pkgdesc='LLVM C++ standard library. (from Fedora rawhide)'
  depends=("libc++abi-rpm=${pkgver}-${_fedoracxxabipkgrel}")
  conflicts=('libc++')
  provides=("libc++=${pkgver}-${_fedoracxxpkgrel}")
  cd "${pkgdir}"
  bsdtar -x -p -f "${srcdir}/libcxx-$pkgver-$_fedoracxxpkgrel.$_fedorarelease.$_ARCH.rpm"
  bsdtar -x -p -f "${srcdir}/libcxx-devel-$pkgver-$_fedoracxxpkgrel.$_fedorarelease.$_ARCH.rpm"

  cd usr
  rm -rf lib
  mv lib64 lib
}

package_libc++abi-rpm() {
  _ARCH=""

  # Update the architecture name based on the current one running this PKGBUILD
  if [ "$CARCH" == "armv7h" ]; then
    _ARCH="armv7hl"
  else
    _ARCH="$CARCH"
  fi

  pkgdesc='Low level support for the LLVM C++ standard library. (from Fedora rawhide)'
  conflicts=('libc++abi')
  provides=("libc++abi=${pkgver}-${_fedoracxxabipkgrel}")
  cd "${pkgdir}"
  bsdtar -x -p -f "${srcdir}/libcxxabi-$pkgver-$_fedoracxxabipkgrel.$_fedorarelease.$_ARCH.rpm"
  bsdtar -x -p -f "${srcdir}/libcxxabi-devel-$pkgver-$_fedoracxxabipkgrel.$_fedorarelease.$_ARCH.rpm"

  cd usr
  rm -rf lib
  mv lib64 lib
}

