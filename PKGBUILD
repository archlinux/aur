# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.1
pkgname=('dotnet-runtime-2.1' 'dotnet-sdk-2.1')
pkgver=2.1.21.sdk809
_runtimever=2.1.21
_sdkver=2.1.809
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/60004ecc-c02d-41d9-b5d9-862ad3ca2547/7110e558abf1c1a074d42bf40e0e7514/dotnet-sdk-2.1.809-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/e953d07d-7831-4fb7-a75f-ad98ef94faa9/06d20252d1b6859c45e1c046822d1559/dotnet-sdk-2.1.809-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/a44fb0b1-2c91-41d6-8970-321872341326/7e150d5bc0d3d96ae8c7cbd9e6b890fe/dotnet-sdk-2.1.809-linux-x64.tar.gz')
sha512sums_armv7h=('7c3b7b049c1bc29f31d44e2406227b3766c745cb98cadd8da16d9df4d8c608d23ab5ff8888b9c43e02fd88989a8f03eb850f34a4b0fb78c5e8b0aedcb5a8d24c')
sha512sums_aarch64=('8d3f91842c278dce388831147f4d302d7560f88327d2b72320b9ab75a58ec4de1a50cfaa8a138a8ca0e227670df84a755b328f8109eebe3db996cda8b5264d5d')
sha512sums_x86_64=('cb0611edd3543380c57b5181a5b093b178da49fee9dea32f76af80c4711823f0053661ca11546546571e6ebe4e60d62ab745ade88904ad35de46662251abd769')

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
