# Maintainer: Max Liebkies <mail at maxliebkies dot de>

pkgname=dotnet-host
pkgver=2.0.0_preview2_25407_01
pkgrel=2
pkgdesc="A command line utility for building, testing, packaging and running .NET Core applications and libraries"
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
depends=()
options=('staticlibs')
conflicts=('dotnet-bin' 'dotnet-cli')
replaces=('dotnet-cli')
provides=('dotnet-cli')

source=("https://download.microsoft.com/download/8/5/8/85896F6E-C7F5-4ECA-ADF7-CCE8EFAD9AA6/dotnet-runtime-2.0.0-preview2-25407-01-linux-x64.tar.gz")

sha256sums=('1fe615f179fef606b97d43ce07a491da9067716ff594f929b82d8772d461c027')

package() {
  mkdir -p "${pkgdir}/opt/dotnet/"
  mkdir -p "${pkgdir}/usr/bin/"

  install -m 755 -o root -g root -D "${srcdir}/host/fxr/${pkgver//_/-}/libhostfxr.so" "${pkgdir}/opt/dotnet/host/fxr/${pkgver//_/-}/libhostfxr.so"
  install -m 755 -o root -g root -D "${srcdir}/dotnet" "${pkgdir}/opt/dotnet/dotnet"

  install -m 644 -o root -g root -D "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/dotnet/LICENSE"
  install -m 644 -o root -g root -D "${srcdir}/ThirdPartyNotices.txt" "${pkgdir}/usr/share/licenses/dotnet/ThirdPartyNotices"
  
  chown -R root:root "${pkgdir}/opt/dotnet"
  ln -s "/opt/dotnet/dotnet" "${pkgdir}/usr/bin/dotnet"
}

# vim:set ts=2 sw=2 et:
