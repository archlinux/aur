# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=swiftly
pkgname=swiftly-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="A Swift toolchain installer and manager, written in Swift."
arch=('x86_64')
url="https://swift-server.github.io/swiftly/"
license=('apache')
depends=('libutil-linux' 'libxml2' 'ncurses5-compat-libs')
optdepends=('python36: required for REPL')
options=('!strip')
provides=(swift-language)
conflicts=(swift-language)
source=("https://github.com/swift-server/${_pkgname}/releases/download/${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu")
sha256sums=('b3ef4e3d652a622af8f5ec54c1264e0ad9de37fa26e81cfe70649833c0039e45')
install='swiftly-bin.install'

package() {
  mkdir -p ~/.local/share/${_pkgname}/toolchains
  if [ ! -f ~/.local/share/${_pkgname}/config.json ]; then
    echo "{ \"platform\": { \"name\": \"centos7\", \"nameFull\": \"centos7\", \"namePretty\": \"Arch Linux\" }, \"installedToolchains\": [] }" > ~/.local/share/${_pkgname}/config.json    # basic config.json setup
  fi
  install -D -m 0755 ${_pkgname}-x86_64-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}
  echo "Config and toolchains can be found in ~/.local/share/swiftly. Toolchains are installed to ~/.local/bin."
  echo "Please do not modify ~/.local/share/swiftly/toolchains. That directory should only be managed by swiftly itself."
}
