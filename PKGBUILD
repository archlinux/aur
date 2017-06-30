# Maintainer: Max Liebkies <mail at maxliebkies dot de>

pkgname=dotnet-runtime-2.0
pkgver=2.0.0_preview2_25407_01
pkgrel=1
pkgdesc="A command line utility for building, testing, packaging and running .NET Core applications and libraries"
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
depends=('lldb' 'libunwind' 'icu' 'lttng-ust' 'openssl' 'curl' 'dotnet-host')
options=('staticlibs')

conflicts=('dotnet-lts')

source=("https://download.microsoft.com/download/8/5/8/85896F6E-C7F5-4ECA-ADF7-CCE8EFAD9AA6/dotnet-runtime-2.0.0-preview2-25407-01-linux-x64.tar.gz")

sha256sums=('1fe615f179fef606b97d43ce07a491da9067716ff594f929b82d8772d461c027')

package() {
  mkdir -p "${pkgdir}/opt/dotnet/shared/Microsoft.NETCore.App/"

  cp --force --preserve=mode --recursive "${srcdir}/shared/Microsoft.NETCore.App/${pkgver//_/-}" "${pkgdir}/opt/dotnet/shared/Microsoft.NETCore.App/${pkgver//_/-}"

  chown -R root:root "${pkgdir}/opt/dotnet"
  find "${pkgdir}/opt/dotnet" -name *.dll -exec chmod 644 {} \;
  find "${pkgdir}/opt/dotnet" -name *.exe -exec chmod 755 {} \;
  find "${pkgdir}/opt/dotnet" -name *.so -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et:
