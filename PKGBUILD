# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-5.0-bin
pkgname=(
  'aspnet-runtime-5.0-bin'
  'dotnet-runtime-5.0-bin'
  'dotnet-sdk-5.0-bin'
  'dotnet-targeting-pack-5.0-bin'
  'aspnet-targeting-pack-5.0-bin'
 )
pkgver=5.0.17.sdk408
_runtimever=5.0.17
_sdkver=5.0.408
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/4dd22f89-07fe-4de6-8590-a00733264a83/a9f2479b467851cbeb2269a8de0a39b9/dotnet-sdk-5.0.408-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/d4b71fac-a2fd-4516-ac58-100fb09d796a/e79d6c2a8040b59bf49c0d167ae70a7b/dotnet-sdk-5.0.408-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/904da7d0-ff02-49db-bd6b-5ea615cbdfc5/966690e36643662dcc65e3ca2423041e/dotnet-sdk-5.0.408-linux-x64.tar.gz')
sha512sums_armv7h=('4f12b2c6cc242666450eb5f892430a956ff34b2ab30aa63ee444565327fbad569152506e153a550b4a45cad6d8346f37ca7bcca68e9d46540c7f170e24b26296')
sha512sums_aarch64=('50f23d7aca91051d8b7c37f1a76b1eb51e6fe73e017d98558d757a6b9699e4237d401ce81515c1601b8c21eb62fee4e0b4f0bbed8967eefa3ceba75fc242f01b')
sha512sums_x86_64=('abbf22c420df2d8398d1616efa3d31e1b8f96130697746c45ad68668676d12e65ec3b4dd75f28a5dc7607da58b6e369693c0e658def15ce2431303c28e99db55')

package_dotnet-runtime-5.0-bin() {
  pkgdesc='The .NET Core runtime version 5.0 (binary) - End of life'
  depends=("dotnet-host>=${_runtimever}"
           'glibc'
           'icu' 
           'krb5'
           'libunwind'
           'openssl'
           'zlib'
  )
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime=${_runtimever}" "dotnet-runtime-5.0")
  conflicts=("dotnet-runtime=${_runtimever}" "dotnet-runtime-5.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-5.0-bin
}

package_aspnet-runtime-5.0-bin() {
  pkgdesc='The ASP.NET Core runtime version 5.0 (binary) - End of life'
  depends=('dotnet-runtime-5.0-bin')
  provides=("aspnet-runtime=${_runtimever}" "aspnet-runtime-5.0")
  conflicts=("aspnet-runtime=${_runtimever}" "aspnet-runtime-5.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-5.0-bin
}

package_dotnet-sdk-5.0-bin() {
  pkgdesc='The .NET Core SDK version 5.0 (binary) - End of life'
  depends=(
    'dotnet-runtime-5.0-bin'
    'glibc'
    'dotnet-targeting-pack-5.0-bin'
    "netstandard-targeting-pack-2.1")
  optdepends=('aspnet-targeting-pack-5.0-bin: Build ASP.NET Core applications')
  provides=("dotnet-sdk-5.0-bin" "dotnet-sdk=${pkgver}" "dotnet-sdk-5.0")
  conflicts=("dotnet-sdk-5.0-bin" "dotnet-sdk=${pkgver}" "dotnet-sdk-5.0")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-5.0-bin
}

package_dotnet-targeting-pack-5.0-bin() {
  pkgdesc='The .NET Core targeting pack version 5.0 (binary) - End of life'
  depends=("netstandard-targeting-pack-2.1")
  provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-5.0)
  conflicts=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-5.0)

  if [ $CARCH = 'x86_64' ]; then msarch=x64;
  elif [ $CARCH = 'armv7h' ]; then msarch=arm;
  elif [ $CARCH = 'aarch64' ]; then msarch=arm64; fi

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-${msarch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-5.0-bin
}

package_aspnet-targeting-pack-5.0-bin() {
  pkgdesc='The ASP.NET Core targeting pack version 5.0 (binary) - End of life'
  depends=(dotnet-targeting-pack-5.0-bin)
  provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-5.0)
  conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-5.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-5.0-bin
}