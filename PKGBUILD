# Maintainer: Max Liebkies <mail at maxliebkies dot de>

pkgname=dotnet-runtime-2.0
pkgver=2.0.0
pkgrel=3
epoch=1
pkgdesc="The .NET Core runtime, called CoreCLR, and the base library, called mscorlib. It includes the garbage collector, JIT compiler, base .NET data types and many low-level classes."
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
depends=('lldb' 'libunwind' 'icu' 'lttng-ust' 'dotnet-host' 'curl' 'openssl-1.0')
options=('staticlibs')

conflicts=('dotnet-lts')

source=("https://download.microsoft.com/download/5/F/0/5F0362BD-7D0A-4A9D-9BF9-022C6B15B04D/dotnet-runtime-2.0.0-linux-x64.tar.gz")

sha256sums=('69ecad24bce4f2132e0db616b49e2c35487d13e3c379dabc3ec860662467b714')

package() {
  mkdir -p "${pkgdir}/opt/dotnet/shared/Microsoft.NETCore.App/"

  cp --force --preserve=mode --recursive "${srcdir}/shared/Microsoft.NETCore.App/${pkgver//_/-}" "${pkgdir}/opt/dotnet/shared/Microsoft.NETCore.App/${pkgver//_/-}"

  chown -R root:root "${pkgdir}/opt/dotnet"
  find "${pkgdir}/opt/dotnet" -name *.dll -exec chmod 644 {} \;
  find "${pkgdir}/opt/dotnet" -name *.exe -exec chmod 755 {} \;
  find "${pkgdir}/opt/dotnet" -name *.so -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et:
