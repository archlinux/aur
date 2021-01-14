# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.1
pkgname=('dotnet-runtime-2.1' 'dotnet-sdk-2.1')
pkgver=2.1.24.sdk812
_runtimever=2.1.24
_sdkver=2.1.812
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/4973ce2e-ac08-44c9-8e90-40652c15e335/5de80a5774508150fb18a44e403f4606/dotnet-sdk-2.1.812-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/8cc13c0a-9ffb-4ad9-9e45-7815c322fe2f/d14b918a64a08f51892cc3513d855a80/dotnet-sdk-2.1.812-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/98903dda-7825-47af-9699-ac44f7f92cb6/7b5b7d7498bd2bc104510c14cb03342d/dotnet-sdk-2.1.812-linux-x64.tar.gz')
sha512sums_armv7h=('1ad81bb664427a539ac56de9bf07e2d1628aabe9f8d6d75b0f652fb1e3f8d21772da53abf63a6523be0a05b06444c050a52246526f3ad64b2252fc3081369959')
sha512sums_aarch64=('e11d5d407008087d90e21ad593fcfc7b2edf7e92221bffeb44597725b88724fd301ff351a52dfeede49b229cd871b719f60d0d0f72c27f1ed895fc4a0fae051b')
sha512sums_x86_64=('09fb6fe64434aa83084c1cd17d632648d4be3146a9a6c0e8e50f574748adcac8c1dadb0c49b3e909252223166fedef97173552331052fce4051b216c9f8497d8')

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
