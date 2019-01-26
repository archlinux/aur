# Maintainer: Bernardo Kuri <aur@bkuri.com>
# Contributor: Frederick Gnodtke <fgnodtke at cronosx dot de>

pkgname=i3-easyfocus-git
pkgver=r46.3631d5a
pkgrel=1
pkgdesc='Focus and select windows in i3.'
arch=('x86_64')
url='https://github.com/cornerman/i3-easyfocus'
license=('GPL')
depends=(
    'i3ipc-glib'
    'libx11'
    'xcb-util-keysyms')
makedepends=(
    'git'
    'gcc')
provides=('i3-easyfocus')
source=('git://github.com/cornerman/i3-easyfocus')
sha256sums=('SKIP')

_gitname='i3-easyfocus'

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_gitname"
  make
}

package() {
  cd "$_gitname"
  install -D -m755 i3-easyfocus "${pkgdir}/usr/bin/i3-easyfocus"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
