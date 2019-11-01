# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

_gitname=pacman-contrib
pkgname=pacman-contrib-git
pkgver=1.2.0.r9.g3da550e
pkgrel=1
pkgdesc='Contributed scripts and tools for pacman systems'
url=https://git.archlinux.org/pacman-contrib.git/about/
arch=('x86_64')
license=('GPL')
depends=('fakeroot' 'pacman' 'perl')
makedepends=('asciidoc' 'git')
optdepends=('findutils: pacdiff'
            'mlocate: pacdiff'
            'sudo: privilege elevation for several scripts')
provides=("$_gitname")
conflicts=("$_gitname")
source=('git+https://git.archlinux.org/pacman-contrib.git')
sha512sums=('SKIP')

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
  make -C $_gitname check
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
