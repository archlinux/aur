# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Co-Maintainer: taotieren <admin@taotieren.com>

pkgname=sonix-flasher-c-git
_gitname=SonixFlasherC
pkgver=2.0.8.r0.gd94d3e9
pkgrel=1
pkgdesc="A CLI-based Flasher for Sonix 24x/26x MCUs."
arch=('x86_64' 'aarch64')
url="https://github.com/SonixQMK/SonixFlasherC"
license=('GPL-3.0-only')
depends=(
  'glibc'
  'hidapi'
  'systemd-libs'
)
makedepends=('git')
source=("git+${url}.git")
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
