_pkgbase=libc++
_fedorabaseurl="https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything"
_fedorapackageurl="os/Packages/l"
_fedorarelease="fc30"
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
"$_fedorabaseurl/x86_64/$_fedorapackageurl/libcxx-$pkgver-$pkgrel.$_fedorarelease.x86_64.rpm"
"$_fedorabaseurl/x86_64/$_fedorapackageurl/libcxx-devel-$pkgver-$pkgrel.$_fedorarelease.x86_64.rpm"
"$_fedorabaseurl/x86_64/$_fedorapackageurl/libcxxabi-$pkgver-$pkgrel.$_fedorarelease.x86_64.rpm"
"$_fedorabaseurl/x86_64/$_fedorapackageurl/libcxxabi-devel-$pkgver-$pkgrel.$_fedorarelease.x86_64.rpm"
)
sha256sums_x86_64=(
'3726f6705ba9c6ebb2e99865a4fadcc97b695f56ec11e2613208c698df33e0f5'
'eb619542d06b774670d2bc06b67d86ddcb3b706a1e2091fd08b9128f4b1cc0d3'
'8575d56cc65944fc9baff708246ee8b6cb7bdc4a98b6e2108d7ec6f69828b94d'
'0baae7fe03f6734ad5bae35a3b108eed11f22d3c28c27990d8f0a84629e8628b'
)
source_armv7h=(
"$_fedorabaseurl/armhfp/$_fedorapackageurl/libcxx-$pkgver-$pkgrel.$_fedorarelease.armv7hl.rpm"
"$_fedorabaseurl/armhfp/$_fedorapackageurl/libcxx-devel-$pkgver-$pkgrel.$_fedorarelease.armv7hl.rpm"
"$_fedorabaseurl/armhfp/$_fedorapackageurl/libcxxabi-$pkgver-$pkgrel.$_fedorarelease.armv7hl.rpm"
"$_fedorabaseurl/armhfp/$_fedorapackageurl/libcxxabi-devel-$pkgver-$pkgrel.$_fedorarelease.armv7hl.rpm"
)
sha256sums_armv7h=(
'cac30f4c46b07b306589d67978e69718920aca952ad97af76a131d3cd3466f32'
'4fb5e3b013f45578f23a27d238f46bdb18315701d43732463eac1df37090c337'
'bda4b17de5ddfb9526d7a164420f45342a6a85fc093ad40759bd46dc5a756ee4'
'1713f53ee886da82d48903c1cd6a130d9ff6ad8e7db9d88ea79325f894fe8a1a'
)
source_aarch64=(
"$_fedorabaseurl/aarch64/$_fedorapackageurl/libcxx-$pkgver-$pkgrel.$_fedorarelease.aarch64.rpm"
"$_fedorabaseurl/aarch64/$_fedorapackageurl/libcxx-devel-$pkgver-$pkgrel.$_fedorarelease.aarch64.rpm"
"$_fedorabaseurl/aarch64/$_fedorapackageurl/libcxxabi-$pkgver-$pkgrel.$_fedorarelease.aarch64.rpm"
"$_fedorabaseurl/aarch64/$_fedorapackageurl/libcxxabi-devel-$pkgver-$pkgrel.$_fedorarelease.aarch64.rpm"
)
sha256sums_aarch64=(
'4eda497a7f5b4cd9ee601783000abe93ae8dee890230080624f1d5922d5e0572'
'0ca0149cad539d314bb3b92098974ff9fde1441b23fb5dc103d3aa0ab283675a'
'8be62e4492e083e54d05e4ac70a5ca2cbb855a4eca5aa00f198da32cadeff2f1'
'399ce14f0fab1f6e3c269c100fb056ec73f6a0b3af9ef9fc14aa512d4360dee5'
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
  depends=("libc++abi-rpm=${pkgver}-${pkgrel}")
  conflicts=('libc++')
  provides=("libc++=${pkgver}-${pkgrel}")
  cd "${pkgdir}"
  bsdtar -x -p -f "${srcdir}/libcxx-$pkgver-$pkgrel.$_fedorarelease.$_ARCH.rpm"
  bsdtar -x -p -f "${srcdir}/libcxx-devel-$pkgver-$pkgrel.$_fedorarelease.$_ARCH.rpm"

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
  provides=("libc++abi=${pkgver}-${pkgrel}")
  cd "${pkgdir}"
  bsdtar -x -p -f "${srcdir}/libcxxabi-$pkgver-$pkgrel.$_fedorarelease.$_ARCH.rpm"
  bsdtar -x -p -f "${srcdir}/libcxxabi-devel-$pkgver-$pkgrel.$_fedorarelease.$_ARCH.rpm"

  cd usr
  rm -rf lib
  mv lib64 lib
}

