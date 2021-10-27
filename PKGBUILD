# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=qbittorrent-cli
pkgver=1.7.21116.1
pkgrel=1
pkgdesc='Command line interface for QBittorrent '
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/fedarovich/qbittorrent-cli"
license=('MIT')
depends=('dotnet-runtime>=3.1.0')
source=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-netcore31-${pkgver}.tar.gz")
sha256sums=('6063231629f6531b4ede4a41702b27729fe93495e7ddd5843e2591d099a030f6')
options=('!strip')

package() {
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}" qbt
  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}" qbt.runtimeconfig.json qbt.deps.json *.dll

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/qbt" "${pkgdir}/usr/bin/qbt"

  install -d "${pkgdir}/usr/lib/${pkgname}/runtimes"
  case "$CARCH" in
    i686)     cp -ar "runtimes/linux-x86"      "${pkgdir}/usr/lib/${pkgname}/runtimes/" ;;
    x86_64)   cp -ar "runtimes/linux-x64"      "${pkgdir}/usr/lib/${pkgname}/runtimes/" ;;
    arm)      cp -ar "runtimes/linux-arm"      "${pkgdir}/usr/lib/${pkgname}/runtimes/" ;;
    aarch64)  cp -ar "runtimes/linux-aarch64"  "${pkgdir}/usr/lib/${pkgname}/runtimes/" ;;
  esac
}
