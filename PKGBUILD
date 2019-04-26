# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

_gitname=pacman-contrib
pkgname=pacman-contrib-git
pkgver=1.1.0.r24.g4e2273e
pkgrel=1
pkgdesc='pacman contributions'
url=https://git.archlinux.org/pacman-contrib.git
arch=('x86_64')
license=('GPL')
depends=('bash' 'pacman' 'perl')
makedepends=('asciidoc' 'git')
provides=("$_gitname")
conflicts=("$_gitname")
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed -r 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var --enable-git-version \
    --with-vim-dir=/usr/share/vim/vimfiles
  make V=1
}

check() {
  make -C $_gitname check
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
