# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.1
pkgname=('dotnet-runtime-2.1' 'dotnet-sdk-2.1')
pkgver=2.1.20.sdk808
_runtimever=2.1.20
_sdkver=2.1.808
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/93b1556c-2811-41ae-a812-723c3421231c/f344530dc21041c67e6b350134ca2235/dotnet-sdk-2.1.808-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/c830296d-914b-4c32-9120-b12ae381508c/0e04904bba21cced791825204d712ebf/dotnet-sdk-2.1.808-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/a3d67819-aa9d-4258-a19b-e5933c18d8b6/7fdd9609d50f6e4af6551983ff0b32d3/dotnet-sdk-2.1.808-linux-x64.tar.gz')
sha512sums_armv7h=('35e024fafa3babc367900828299d16c484f380c171b849d5157202b77dc99ed4c5f7af612f427bbeefba4939eb95d1faeb9c8bfb6afa14ce75d5c2c36210d5ec')
sha512sums_aarch64=('797479506373cd39490067ac8428d29e815862f7bbe121364b8d91c07a56d0d9498d98afa015da2f5bf285ccac05fa8bfac2c00e7757e97b8d65a9e03ab94c3c')
sha512sums_x86_64=('1c5bf0421a3447a15f5f65a0c736b0463b24c80be6aaf1f30d70be285e0e2d1e8c01948c4a318f5fe14e222d789afe1db16a09974e81fb34326e73784391c522')

# Versioning details for dependencies
# https://docs.microsoft.com/en-us/dotnet/core/versions/#versioning-details

package_dotnet-runtime-2.1() {
  pkgdesc='The .NET Core runtime version 2.1'
  depends=('dotnet-host' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
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
