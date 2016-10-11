# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=pacman-contrib-git
pkgver=r21.3093437
pkgrel=1
pkgdesc='pacman contributions (Git version)'
url=https://git.archlinux.org/pacman-contrib.git
arch=('i686' 'x86_64')
arch=('any')
license=('GPL')
depends=('pacman-git') # change to 'pacman' after release 5.0.2
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-*}
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
    --with-vim-dir=/usr/share/vim/vimfiles
  make V=1
}

check() {
  make -C ${pkgname%-*} check
}

package() {
  cd ${pkgname%-*}
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
