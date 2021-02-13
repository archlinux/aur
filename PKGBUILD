# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.1
pkgname=('dotnet-runtime-2.1' 'dotnet-sdk-2.1')
pkgver=2.1.25.sdk813
_runtimever=2.1.25
_sdkver=2.1.813
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/44eecfb8-9e68-47dd-a114-fae139f5529c/665ac18f282a5f8554523de3f8dae1f3/dotnet-sdk-2.1.813-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/0c96a1ac-ea01-42bf-b889-f07566ffe031/2b74d411c54506f9913ca21f5df5f9a8/dotnet-sdk-2.1.813-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/e1883c23-aad6-4658-a0bf-cdfb3d430d26/a2b8bdd775b9f5b1ff3424463955001c/dotnet-sdk-2.1.813-linux-x64.tar.gz')
sha512sums_armv7h=('9602894b488f8fc3dd4f2dd57ef9092748edae9699dfe385157f32c7be3f1d8914274c130b6634e39fd4bc8f76be2e148a934770c0c8e5b8dc7f75edeac186e3')
sha512sums_aarch64=('8b953577e293ea61e764e9a54cdf7e94f0d33fccde699c339dbf298ff7bb3265858f96ea7922df2fa49aeed7572b24ef92e8d0f98b394b9b592f6d3fe8555ad5')
sha512sums_x86_64=('fbf4bbe5ff88bd12ef9da097839e9b426ce6d03b5ebff4a32f8cbc8b082b1086d5b6daacbe6c38e581d606ca2e4d7da98bac86ed608ecbee35616f9b9adbfa53')

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
