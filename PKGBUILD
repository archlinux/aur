# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=swiftly
pkgname=swiftly-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="A Swift toolchain installer and manager, written in Swift."
arch=('x86_64' 'aarch64')
url="https://swiftlang.github.io/swiftly/"
license=('apache')
depends=('util-linux-libs' 'libxml2-legacy' 'ncurses' 'gcc')
optdepends=('python39: required for REPL' 'gnupg: required for toolchain verification')
options=('!strip')
provides=(swift-language)
conflicts=(swift-language)
source_x86_64=("https://download.swift.org/${_pkgname}/linux/${_pkgname}-${pkgver}-x86_64.tar.gz")
source_aarch64=("https://download.swift.org/${_pkgname}/linux/${_pkgname}-${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('4c4adb7b7ad7910f38c52b94a938c309586fe395e1fe1538c397384ee36bfff0')
sha256sums_aarch64=('cc4f912fff6c7f53704fc6d22f9e8ee7fdf6bd574ad276998f7502418bf5a45a')

package() {
  install -D -m 0755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

  # setting up symlinks to existing ncurses libs (no ncurses5-compat-libs needed!)
  mkdir -p ${pkgdir}/usr/lib
  ln -s /usr/lib/libncursesw.so.6 ${pkgdir}/usr/lib/libncurses.so.6
  ln -s /usr/lib/libformw.so.6 ${pkgdir}/usr/lib/libform.so.6
  ln -s /usr/lib/libpanelw.so.6 ${pkgdir}/usr/lib/libpanel.so.6

  echo "This package is meant to be used with RHEL 9 (ubi9) Swift releases."
}
