# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=pacman-contrib-git
_gitname=pacman-contrib
pkgver=0.0.1.r8.g86adc7b
pkgrel=1
pkgdesc='pacman contributions (Git version)'
url=https://git.archlinux.org/$_gitname.git
arch=('i686' 'x86_64')
license=('GPL')
depends=('pacman-git') # Change to 'pacman' after its next release
makedepends=('asciidoc' 'git')
provides=("$_gitname")
replaces=("$_gitname")
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
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
