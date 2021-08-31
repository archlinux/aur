# Maintainer: Atom Long <atom.long@hotmail.com>

pkgname=shadowsocks-helper-git
_pkgname='shadowsocks-helper'
pkgver=0.10.0.r14.gfe6831a
pkgrel=1
pkgdesc='Shadowsocks helper utility'
arch=('any')
url='https://github.com/honwen/shadowsocks-helper'
license=('Apache')
makedepends=('go')
source=("git+https://github.com/honwen/shadowsocks-helper.git")
sha256sums=('SKIP')
provides=('shadowsocks-helper')
conflicts=('shadowsocks-helper')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  go build -o release/shadowsocks-helper
}

package() {
  cd "${_pkgname}"
  # binary
  install -D -m755 release/shadowsocks-helper "${pkgdir}/usr/bin/shadowsocks-helper"
  # doc files
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
