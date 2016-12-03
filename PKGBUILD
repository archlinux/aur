pkgname=dotnet-bin
pkgver="1.1.0"
pkgrel=3
pkgdesc="Develop web sites and services that run on Linux, Windows and macOS with the blazing fast and modular platform provided by .NET Core and ASP.NET Core."
arch=(x86_64)
url="https://www.microsoft.com/net/core"
groups=()
depends=('lldb' 'libunwind' 'icu55' 'lttng-ust' 'openssl' 'curl' 'libcurl-compat')
makedepends=('tar' 'gettext')
provides=('dotnet')
conflicts=()
replaces=()
backup=()
options=(staticlibs)
install=

source=("dotnet.tar.gz::https://go.microsoft.com/fwlink/?LinkID=834985")
sha256sums=('4FDAE55113557171A0898B283EEF13669A7D722FB2B918A595EB2AB70DB1D8A8')

package() {
  mkdir -p "${pkgdir}/opt/dotnet"
  mkdir -p "${pkgdir}/usr/bin"
  rm -rf "${srcdir}/dotnet.tar.gz"
  mv "${srcdir}"/* "${pkgdir}/opt/dotnet/"
  cat > "${pkgdir}/usr/bin/dotnet" <<EOF
#!/bin/sh
LD_PRELOAD=libcurl.so.3 exec /opt/dotnet/dotnet "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/dotnet"
  chown -R 0:0 "${pkgdir}/opt/dotnet"
}
