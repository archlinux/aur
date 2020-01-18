# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-3.0
pkgname=( 'aspnet-runtime-3.0' 'dotnet-runtime-3.0' 'dotnet-sdk-3.0')
pkgver=3.0.2.sdk102
_runtimever=3.0.2
_sdkver=3.0.102
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
makedepends=(
  'clang' 'cmake' 'curl' 'git' 'icu' 'krb5' 'libunwind' 'lldb' 'llvm'
  'lttng-ust' 'openssl' 'zlib'
)
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/162513e7-32f5-4896-aecd-729573940bd9/f7f1b9528f1a77199c4124236ebfd747/dotnet-sdk-3.0.102-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/ce72d357-7408-43a7-918a-daf7eba2f6b2/52fc87abf9fba272efe103e3da396b94/dotnet-sdk-3.0.102-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/2e2cbde1-f97b-4d6f-8fd9-7880aa46b025/8e5ead3dda8340867ba1e09273993351/dotnet-sdk-3.0.102-linux-x64.tar.gz')
sha512sums_armv7h=('f4151e9f2b2c719cf32c61fcc2a12eb7cf378889f6909cfaf5e24bbc6400a52fa29dd13f45494b1713afdd276565a4b44a560be860602f65fbbb707afe504da4')
sha512sums_aarch64=('9f3d0e30180a0b7967a6827f0a83023af90d6ccd9ff89c67e648d043add553d7ae1b60dc19f77db3f8c18dc2574b3cf7ed586b0805d49f0e8945c6ee1ddc9c9d')
sha512sums_x86_64=('77bc287d9c20630976ac4c0736192ba4899154c9e7cc5b87bc9d94d5d8abafdd832cfe8f385b6ba584c702d9261566109df15ab46b0d62bd218d950d3b47893e')

package_dotnet-runtime-3.0() {
  pkgdesc='The .NET Core runtime (binary)'
  depends=('dotnet-host' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime-3.0" "dotnet-runtime=${pkgver}")
  conflicts=("dotnet-runtime-3.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-3.0
}

package_aspnet-runtime-3.0() {
  pkgdesc='The ASP.NET Core runtime (binary)'
  depends=('dotnet-runtime-3.0')
  provides=("aspnet-runtime-3.0" "aspnet-runtime=${pkgver}")
  conflicts=("aspnet-runtime-3.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-3.0
}

package_dotnet-sdk-3.0() {
  pkgdesc='The .NET Core SDK (binary)'
  depends=('dotnet-runtime-3.0')
  provides=("dotnet-sdk-3.0" "dotnet-sdk=${pkgver}")
  conflicts=("dotnet-sdk-3.0")
  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' packs sdk templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-3.0
}