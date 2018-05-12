# Maintainer: Thomas Guillemard <me[at]thog[dot]eu>

pkgbase=dotnet-core-rc
pkgname=('dotnet-host-rc' 'dotnet-runtime-rc')
pkgver=2.1.0
pkgrel=1
arch=('x86_64')
url='https://www.microsoft.com/net/core'
license=('MIT')
depends=('gcc-libs' 'glibc')
options=('staticlibs')
source=('https://download.microsoft.com/download/D/0/B/D0B7F62D-9C5D-4CF3-AB6C-88F56B4FC1A9/dotnet-runtime-2.1.0-rc1-linux-x64.tar.gz')
sha256sums=('f720cf96ec174369e1fa217be8935ad787fe7964eeb8b3f062dfc89c08d1736e')

package_dotnet-host-rc() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface'
  provides=('dotnet-host')
  conflicts=('dotnet-host')

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/bin,usr/share/licenses/dotnet-host}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/opt/dotnet/
  install -m 644 *.txt -t "${pkgdir}"/usr/share/licenses/dotnet-host/
  ln -s /opt/dotnet/dotnet "${pkgdir}"/usr/bin/
}

package_dotnet-runtime-rc() {
  pkgdesc='The .NET Core runtime'
  depends+=('dotnet-host-rc' 'icu' 'krb5' 'libunwind'  'lldb' 'lttng-ust' 'openssl-1.0' 'zlib'
            'libcurl.so' 'libuuid.so')
  provides=('dotnet-runtime-2.0' 'dotnet-runtime')
  conflicts=('dotnet-runtime-2.0' 'dotnet-runtime')

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared "${pkgdir}"/opt/dotnet/
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-runtime
}

