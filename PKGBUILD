# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=swiftly
pkgname=swiftly-bin
pkgver=1.0.0
pkgrel=4
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
sha256sums_x86_64=('8c11f8bdeee212ed4b541a1ce2708866d4d290fdfe02362b0048b4cc57614341')
sha256sums_aarch64=('551cf36ef77d18ce2cef742750a3265ebfcf1a104bd429979f7ab6fbdbc42a8d')

package() {
  install -D -m 0755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

  # setting up symlinks to existing ncurses libs (no ncurses5-compat-libs needed!)
  mkdir -p ${pkgdir}/usr/lib
  ln -s /usr/lib/libncursesw.so.6 ${pkgdir}/usr/lib/libncurses.so.6
  ln -s /usr/lib/libformw.so.6 ${pkgdir}/usr/lib/libform.so.6
  ln -s /usr/lib/libpanelw.so.6 ${pkgdir}/usr/lib/libpanel.so.6
}
