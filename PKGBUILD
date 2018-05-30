# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

_gitname=pacman-contrib
pkgname=pacman-contrib-git
pkgver=1.0.0.r0.ge741857
pkgrel=1
pkgdesc='pacman contributions (Git version)'
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
