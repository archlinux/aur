# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

_gitname=pacman-contrib
pkgname=pacman-contrib-git
pkgver=1.5.1.r11.g5455ffe
pkgrel=1
pkgdesc='Contributed scripts and tools for pacman systems'
arch=('x86_64')
url=https://gitlab.archlinux.org/pacman/pacman-contrib
license=('GPL')
depends=('fakeroot' 'pacman' 'perl')
makedepends=('asciidoc' 'git')
optdepends=('diffutils: for pacdiff'
            'findutils: for pacdiff --find'
            'mlocate: for pacdiff --locate'
            'sudo: privilege elevation for several scripts'
            'vim: default merge program for pacdiff')
provides=("$_gitname")
conflicts=("$_gitname")
source=("git+$url.git")
b2sums=('SKIP')
#validpgpkeys=('5134EF9EAF65F95B6BB1608E50FB9B273A9D0BB5'  # Johannes Löthberg <johannes@kyriasis.com>
#              '04DC3FB1445FECA813C27EFAEA4F7B321A906AD9') # Daniel M. Capella <polyzen@archlinux.org>

pkgver() {
  cd $_gitname
  git describe --long --tags | sed -r 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd $_gitname
  ./autogen.sh
}

build() {
  cd $_gitname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-git-version
  make
}

check() {
  cd $_gitname
  make check
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
