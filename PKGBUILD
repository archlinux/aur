# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.1
pkgname=('dotnet-runtime-2.1' 'dotnet-sdk-2.1')
pkgver=2.1.15.sdk803
_runtimever=2.1.15
_sdkver=2.1.803
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
makedepends=(
  'clang' 'cmake' 'curl' 'git' 'icu' 'krb5' 'libunwind' 'lldb' 'llvm'
  'lttng-ust' 'openssl' 'zlib'
)
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/a9668b0a-6b9c-431a-b009-2cd4ae80dcdf/1d52e8dafeda6e66bcf9ba2a16a35cd3/dotnet-sdk-2.1.803-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/9b3f7bac-a314-4886-8477-0686bfb1cbc4/746767a98f7278755f4952dd18eb4eed/dotnet-sdk-2.1.803-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/701502b0-f9a2-464f-9832-4e6ca3126a2a/62655f151db917025e9be8cc4b7c1ed9/dotnet-sdk-2.1.803-linux-x64.tar.gz')
sha512sums_armv7h=('6c7e4616f25945c400b2b6c18752743268af1618651b0538576626b1fa9f98e4e8338c0b913109d3725e6f421e8206b5c0a2621a6bb25360bb14a2620a566ed6')
sha512sums_aarch64=('646d0028949b2925ec735c44e56adefe59292825e400536f76af5ec1a31153a2dc402677996169ce934001210e65c0922c3e20197938ca39a19df2a7358daca4')
sha512sums_x86_64=('57d48d6ca1bd92ac348dc05220d984811c0cf005774d7afdfbbf125a842acb0a26572146ed25a7eb26f4e0404fe840b70d1e7ec1fb7c9a5c6cfe81fefc41b363')

# Versioning details for dependencies
# https://docs.microsoft.com/en-us/dotnet/core/versions/#versioning-details

package_dotnet-runtime-2.1() {
  pkgdesc='The .NET Core runtime version 2.1'
  depends=('dotnet-host' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime-2.1")
  conflicts=("dotnet-runtime-2.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/dotnet-runtime-2.1
}

package_dotnet-sdk-2.1() {
  pkgdesc='The .NET Core SDK version 2.1'
  depends=('dotnet-runtime-2.1')
  provides=("dotnet-sdk-2.1")
  conflicts=("dotnet-sdk-2.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/dotnet-sdk-2.1
}
