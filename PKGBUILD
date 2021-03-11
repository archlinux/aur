# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.1
pkgname=('dotnet-runtime-2.1' 'dotnet-sdk-2.1')
pkgver=2.1.26.sdk814
_runtimever=2.1.26
_sdkver=2.1.814
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/e71188f5-730b-4452-b897-2f16a25cb35a/0240714ac64452802baf7a8f5c6750c6/dotnet-sdk-2.1.814-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/3d49abc4-f6c7-4a34-86bc-5d715b2a9b9b/4b9644bf81dc9b569e282b767379e190/dotnet-sdk-2.1.814-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/b44d40e6-fa23-4f2d-a0a9-4199731f0b1e/5e62077a9e8014d8d4c74aee5406e0c7/dotnet-sdk-2.1.814-linux-x64.tar.gz')
sha512sums_armv7h=('a4e12b9b1febe4ba6a5319894543bf2fb61d2311354b0eda3f664a4d8aefea0b8edc867ff13de87e84f3285925911e94c050033993038f37253a0626687136a5')
sha512sums_aarch64=('2c4a74d6b238ab316e0e60caff77eaeafe5de8fa44fc3b0d828cf81de97d99b065a6260f1e6209f4021be0bc1c9f082a9648c341d65cd36fe3dce1b6eb86ae96')
sha512sums_x86_64=('79408996f53650d0c3ac39348fa102537d14190ba5dcc4b9152cdb8fc72566608ad7430f196731eeb62dcfacdb0f2fa37577b5d51e165afd9dd9ae15f9d2aabc')

# Versioning details for dependencies
# https://docs.microsoft.com/en-us/dotnet/core/versions/#versioning-details

package_dotnet-runtime-2.1() {
  pkgdesc='The .NET Core runtime version 2.1'
  depends=('dotnet-host' 'glibc' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime-2.1" "dotnet-runtime=${_runtimever}")
  conflicts=("dotnet-runtime-2.1" "dotnet-runtime=${_runtimever}")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/dotnet-runtime-2.1
}

package_dotnet-sdk-2.1() {
  pkgdesc='The .NET Core SDK version 2.1'
  depends=('dotnet-runtime-2.1' 'glibc')
  provides=("dotnet-sdk-2.1" "dotnet-sdk=${pkgver}")
  conflicts=("dotnet-sdk-2.1" "dotnet-sdk=${pkgver}")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/dotnet-sdk-2.1
}
