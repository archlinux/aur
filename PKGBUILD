# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=swiftly
pkgname=swiftly-bin
pkgver=1.1.1
pkgrel=2
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
sha256sums_x86_64=('dc5f94308b33455530f4150b412527596a33c8525a7d59b025b598520e92d121')
sha256sums_aarch64=('e664899868b2dea9a1e7a7fbad0521c24aceeca14bbcbb22ba5cda1f62c37ed4')

package() {
  install -D -m 0755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

  # setting up symlinks to existing ncurses libs (no ncurses5-compat-libs needed!)
  mkdir -p ${pkgdir}/usr/lib
  ln -s /usr/lib/libncursesw.so.6 ${pkgdir}/usr/lib/libncurses.so.6
  ln -s /usr/lib/libformw.so.6 ${pkgdir}/usr/lib/libform.so.6
  ln -s /usr/lib/libpanelw.so.6 ${pkgdir}/usr/lib/libpanel.so.6

  echo "This package is meant to be used with RHEL 9 (ubi9) Swift releases."
}
