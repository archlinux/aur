# Maintainer: Jean-Marc Lenoir <archlinux "at" jihemel "dot" com>

_pkgname=dpms-off
pkgname=${_pkgname}-git
pkgver=r18.17c5600
pkgrel=1
pkgdesc="Turn off monitors to save power (for Wayland)"
arch=('i686' 'x86_64')
license=('BSD-3-Clause')
url='https://github.com/lilydjwg/dpms-off'
makedepends=('cargo')
source=(git+https://github.com/lilydjwg/dpms-off)
sha256sums=('SKIP')

pkgver()
{
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build()
{
  cd "${_pkgname}"
  cargo build --release
}

package()
{
  cd "${_pkgname}"
  install -Dm755 target/release/dpms-off "${pkgdir}/usr/bin/dpms-off"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
