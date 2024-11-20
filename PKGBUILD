# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=sonix-flasher-c-git
_gitname=SonixFlasherC
pkgver=2.0.7.r0.gf3ba677
pkgrel=1
pkgdesc="A CLI-based Flasher for Sonix 24x/26x MCUs."
arch=('x86_64' 'aarch64')
url="https://github.com/SonixQMK/SonixFlasherC"
license=('GPL-3.0')
depends=('glibc'
         'hidapi'
         'libudev.so=1')
makedepends=('git')
source=("git+https://github.com/SonixQMK/SonixFlasherC")
provides=("sonix-flasher-c" "sonixflasher")
conflicts=("sonix-flasher-c" "sonixflasher")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_gitname}"
  make sonixflasher
}

package() {
  cd "${_gitname}"
  
  install -Dm755 sonixflasher -t "$pkgdir/usr/bin"
}
# vim: ts=2 sw=2 et:
