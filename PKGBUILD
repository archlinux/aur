# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.1
pkgname=('dotnet-runtime-2.1' 'dotnet-sdk-2.1')
pkgver=2.1.30.sdk818
_runtimever=2.1.30
_sdkver=2.1.818
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/ba99642d-36fc-4654-95c3-112711ca6e41/7ef9d5f0a6d9b432069b68b46d81867c/dotnet-sdk-2.1.818-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/04bec57b-d2a9-46b0-8c97-848558818000/1e67e2407b0518c9d2a692ba1fc99b22/dotnet-sdk-2.1.818-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/5797d98a-8faf-472d-925c-931ac542d3c8/e48942da88f4d9d653a7b5c0790e7724/dotnet-sdk-2.1.818-linux-x64.tar.gz')
sha512sums_armv7h=('3aac9149980b33b3ceaf147dbb380aa3e1a0ea5e11af88a17a0dde79f2ec40c52bcdc2c95c66928dac65796524066c2b5e127c82388f6c19abcedebd8fe0de1c')
sha512sums_aarch64=('4a8dfb282ba5c8b286e3b09c100a738a43df41fef371d0f6e7b3341aafb8ff00436658d1139175ec0a545e49a15aedda0efc6a4b97b7324c3cef5cdab8ff0451')
sha512sums_x86_64=('0975301378d1238e55285d37aed4ab10df242e0884c0e3bb2eaf2e96af7bf6d554f5df1e653abddabf23ed8f1ea1665c452de42ad912ca84cd71760171416ecd')

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
