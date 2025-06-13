# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=swiftly
pkgname=swiftly-bin
pkgver=1.0.1
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
sha256sums_x86_64=('97e3bf58d6a366f20d8bf4c3245fad499e2517af4757b28ba9eb8c3d481e3da2')
sha256sums_aarch64=('089e8052aacdb596c6533dc7b1a1959adf2b6127f14c4c272099ef317e17d243')

package() {
  install -D -m 0755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

  # setting up symlinks to existing ncurses libs (no ncurses5-compat-libs needed!)
  mkdir -p ${pkgdir}/usr/lib
  ln -s /usr/lib/libncursesw.so.6 ${pkgdir}/usr/lib/libncurses.so.6
  ln -s /usr/lib/libformw.so.6 ${pkgdir}/usr/lib/libform.so.6
  ln -s /usr/lib/libpanelw.so.6 ${pkgdir}/usr/lib/libpanel.so.6

  echo "This package is meant to be used with RHEL 9 (ubi9) Swift releases."
}
