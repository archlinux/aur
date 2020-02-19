# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.1
pkgname=('dotnet-runtime-2.1' 'dotnet-sdk-2.1')
pkgver=2.1.16.sdk804
_runtimever=2.1.16
_sdkver=2.1.804
pkgrel=2
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
makedepends=(
  'clang' 'cmake' 'curl' 'git' 'icu' 'krb5' 'libunwind' 'lldb' 'llvm'
  'lttng-ust' 'openssl' 'zlib'
)
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/365bc2c9-eb08-4c17-b462-e4addba6dd0a/5101726ab1e41e751c169e3b735357fc/dotnet-sdk-2.1.804-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/2d8b6ed1-e489-4e68-bc88-201801435297/bfe788aeab04d79507d940675ee6f27b/dotnet-sdk-2.1.804-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/9ba4d9b0-3fca-40ed-b5a2-1552dfa4f89e/8e5e555b543a7afd8fd764e080d25671/dotnet-sdk-2.1.804-linux-x64.tar.gz')
sha512sums_armv7h=('5a2427fd3461aa5dc5a90857e7d599447c29bbd36daaf216ce2d42d6f430ad5b3278168cfaf5d241bf1340df693c93c5beecc95a5679aab35f40dcbd11dcb486')
sha512sums_aarch64=('4f30381658ca8e45fb7da0db23f5e6a24a61db42e534d097bd59691bb058d1a71906d4386cbcf673eef582616af3b7400cecbdf10959a418bed7a6ed70f7939a')
sha512sums_x86_64=('82b039856dadd2b47fa56a262d1a1a389132f0db037d4ee5c0872f2949c2cd447c33a978e1f532783119aa416860e03f26b840863ca3a97392a4b77f8df5bf66')

# Versioning details for dependencies
# https://docs.microsoft.com/en-us/dotnet/core/versions/#versioning-details

package_dotnet-runtime-2.1() {
  pkgdesc='The .NET Core runtime version 2.1'
  depends=('dotnet-host' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime-2.1" "dotnet-runtime=${pkgver}")
  conflicts=("dotnet-runtime-2.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/dotnet-runtime-2.1
}

package_dotnet-sdk-2.1() {
  pkgdesc='The .NET Core SDK version 2.1'
  depends=('dotnet-runtime-2.1')
  provides=("dotnet-sdk-2.1" "dotnet-sdk=${pkgver}")
  conflicts=("dotnet-sdk-2.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/dotnet-sdk-2.1
}
