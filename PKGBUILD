# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.1
pkgname=('dotnet-runtime-2.1' 'dotnet-sdk-2.1')
pkgver=2.1.29.sdk817
_runtimever=2.1.29
_sdkver=2.1.817
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/4315bff0-490a-49fd-8147-851d8fa844c1/707d038c4783814a06de8133aeb468f4/dotnet-sdk-2.1.817-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/3e58ee72-24c8-4b98-86f9-145deb294ff2/b23cc58351162b38b0a839ca4e8efe00/dotnet-sdk-2.1.817-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/fb3319a2-9b8b-47c5-bed8-22617fb0feb6/ffc365184f20e64f46ebe6d780c50049/dotnet-sdk-2.1.817-linux-x64.tar.gz')
sha512sums_armv7h=('e9daec784173dc5db9b3d96842db121078fc1e0862b36b971eb8a7fbde0c2ec3af2c19a185262549dde2a9555cd6338f7684c50d7a6e1a9c3f7958f5dfc32048')
sha512sums_aarch64=('76392b20622882d7798dac9212902e0875fc764363bc281136af2c098aadbdd35facc392a635a89388e457dc6ef4321ad077f33388ac580a936d4ecd473b5b53')
sha512sums_x86_64=('1bdc0f0bba9a0fbdf0546ff5296d6198aec34b96f5a771ef54f905678ce78de3b1abeac92f42f2118043a69271d268cba196ff3958a37094e5f2e9703966c300')

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
