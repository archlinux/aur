# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.1
pkgname=('dotnet-runtime-2.1' 'dotnet-sdk-2.1')
pkgver=2.1.23.sdk811
_runtimever=2.1.23
_sdkver=2.1.811
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/e41b26f7-5aa1-4c73-ad59-bff8f4f2c82a/654a219d81ed6fd01d1b3c16decc6364/dotnet-sdk-2.1.811-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/475c1c4c-b299-40a9-bbc7-228e5a7d29c5/d903f258073212e1f3b1269ee3fef454/dotnet-sdk-2.1.811-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/4281b67c-db32-4e7e-aa67-976a59839b81/75373c7621c37c2ac7a83fc60d415afd/dotnet-sdk-2.1.811-linux-x64.tar.gz')
sha512sums_armv7h=('b53a1a603528a07a94fc494ef92b900633b91b95f74661738e705748207d401c5910ca00f742ca844d3ad31f430837da78604ca53f96eea104ae8233aeb9c207')
sha512sums_aarch64=('4f1f1a5878d490eda36d74e5de713ae90a2f5cd139383fae527f1649d2a6fe83f663692b39c2290bdf12d737e18356840e772b751f9e59001f2c7d2f7e4e0e03')
sha512sums_x86_64=('ddc6a583c90405a1cf57c33b2ee285ce34d59f82c4f7bc01900f4ce87c45e295de96a0293ad51937ac1935611b87bc73cdafa8acd93b6fda5a2c624b00070326')

# Versioning details for dependencies
# https://docs.microsoft.com/en-us/dotnet/core/versions/#versioning-details

package_dotnet-runtime-2.1() {
  pkgdesc='The .NET Core runtime version 2.1'
  depends=('dotnet-host' 'glibc' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime-2.1" "dotnet-runtime=${pkgver}")
  conflicts=("dotnet-runtime-2.1" "dotnet-runtime=${pkgver}")

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
