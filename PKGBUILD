# Maintainer: Max Liebkies <mail at maxliebkies dot de>

pkgname=dotnet-host
pkgver=2.0.0
pkgrel=3
epoch=1
pkgdesc="A command line utility for building, testing, packaging and running .NET Core applications and libraries"
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
depends=()
options=('staticlibs')
conflicts=('dotnet-bin' 'dotnet-cli')
replaces=('dotnet-cli')
provides=('dotnet-cli')

source=("https://download.microsoft.com/download/5/F/0/5F0362BD-7D0A-4A9D-9BF9-022C6B15B04D/dotnet-runtime-2.0.0-linux-x64.tar.gz")

sha256sums=('69ecad24bce4f2132e0db616b49e2c35487d13e3c379dabc3ec860662467b714')

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
