# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.1
pkgname=('dotnet-runtime-2.1' 'dotnet-sdk-2.1')
pkgver=2.1.22.sdk810
_runtimever=2.1.22
_sdkver=2.1.810
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/7f1fae95-10bd-413b-9a16-5ebf0aaeee09/49233dbd8a506ded8459f80679cfb026/dotnet-sdk-2.1.810-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/853a545a-2b93-4269-88c2-bfee4dc8d066/0be78104bc25d0c3aa140c1726225fda/dotnet-sdk-2.1.810-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/eb1b19f5-3c42-4f7b-b36a-67fae2040506/40cc70f95b6485b0b87bcbc655b7c855/dotnet-sdk-2.1.810-linux-x64.tar.gz')
sha512sums_armv7h=('fe1ec616d88f2d9b9da4a9f48ede9ec2937e15f7d129907e8f14931e91d297d634689f61877df33efd39141f71f53747c55711d0361de04932ad604afe1bff41')
sha512sums_aarch64=('1153fdf383eb4527bb32fb7901354e49b6c60ec381267026e4be1e384a486ac7fbc89f949f9be711de4705eb4e58a1f2db320c2a62822d75e22cd930132ea4b7')
sha512sums_x86_64=('45ceacbf393778254c5e95184d1c284ea21beb38b1610803390858960e5edb1faee0f0c1355e1306ea282f864645fb38fccf85cc01fb10d8ebf48f2b6a658bd0')

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
