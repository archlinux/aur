# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-3.0
pkgname=( 'aspnet-runtime-3.0' 'dotnet-runtime-3.0' 'dotnet-sdk-3.0')
pkgver=3.0.3.sdk103
_runtimever=3.0.3
_sdkver=3.0.103
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
makedepends=(
  'clang' 'cmake' 'curl' 'git' 'icu' 'krb5' 'libunwind' 'lldb' 'llvm'
  'lttng-ust' 'openssl' 'zlib'
)
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/4a44d4d2-19c1-485a-8b58-fa06805cddcf/cc805a1ebd9d72099309dcd46492d36f/dotnet-sdk-3.0.103-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/eb4ffaf1-b0a9-466d-8440-0220dca8f806/48df585d8d978c5418fa514da6a2bd9b/dotnet-sdk-3.0.103-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/43f3a3bd-3df2-41e6-beca-3ec4952ca6c4/30fe7779249607d1bb3bb4b20d61a479/dotnet-sdk-3.0.103-linux-x64.tar.gz')
sha512sums_armv7h=('c4836970b33813f5de36ba6b92cbce2b2ecb9bfd23101cb20af194824ef7b2c899d9d550284616036f546804032aeabc93d5edf5471f9bea73060c341a813a2a')
sha512sums_aarch64=('ceeea4f5590dab0ccc8f016f61db72515bfe1b0d2308a1065696ec654088993f2fbfa7e5b12a486a229c9fbbda657be9f80e03879d9e3038b2d78ea4020f82c4')
sha512sums_x86_64=('22acd337c1f837c586b9d0e3581feeba828c7d6dc64e4c6c9b24bdc6159c635eb7019c3fb0534edeb4f84971e9c3584c7e3a4d80854cf5664d2792ee8fde189b')

package_dotnet-runtime-3.0() {
  pkgdesc='The .NET Core runtime (binary) - End-of-life'
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
  pkgdesc='The ASP.NET Core runtime (binary) - End-of-life'
  depends=('dotnet-runtime-3.0')
  provides=("aspnet-runtime-3.0" "aspnet-runtime=${pkgver}")
  conflicts=("aspnet-runtime-3.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-3.0
}

package_dotnet-sdk-3.0() {
  pkgdesc='The .NET Core SDK (binary) - End-of-life'
  depends=('dotnet-runtime-3.0')
  provides=("dotnet-sdk-3.0" "dotnet-sdk=${pkgver}")
  conflicts=("dotnet-sdk-3.0" "dotnet-sdk>=3")
  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' packs sdk templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-3.0
}