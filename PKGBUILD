# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=swiftly
pkgname=swiftly-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A Swift toolchain installer and manager, written in Swift."
arch=('x86_64' 'aarch64')
url="https://swiftlang.github.io/swiftly/"
license=('apache')
depends=('util-linux-libs' 'libxml2' 'ncurses')
optdepends=('python39: required for REPL' 'gnupg: required for toolchain verification')
options=('!strip')
provides=(swift-language)
conflicts=(swift-language)
source_x86_64=("https://download.swift.org/${_pkgname}/linux/${_pkgname}-${pkgver}-x86_64.tar.gz")
source_aarch64=("https://download.swift.org/${_pkgname}/linux/${_pkgname}-${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('5eda04e6e4232a2df72c5fd8f9d65076563c0dde01e032acd2bf4b40921edd00')
sha256sums_aarch64=('229e066f9ab20fd05ef115eaba8535f85e8e6edd246d3d8e6c88b41e20b80564')

package() {
  install -D -m 0755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

  # setting up symlinks to existing ncurses libs (no ncurses5-compat-libs needed!)
  mkdir -p ${pkgdir}/usr/lib
  ln -s /usr/lib/libncursesw.so.6 ${pkgdir}/usr/lib/libncurses.so.6
  ln -s /usr/lib/libformw.so.6 ${pkgdir}/usr/lib/libform.so.6
  ln -s /usr/lib/libpanelw.so.6 ${pkgdir}/usr/lib/libpanel.so.6

  echo "This package is meant to be used with RHEL 9 (ubi9) Swift releases."
}
