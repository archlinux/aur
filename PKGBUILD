# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Moritz Lipp <mlq@pwmt.org>

_gitname=zathura-cb
pkgname=zathura-cb-git
pkgver=0.1.8.r7.gd03db86
pkgrel=1
pkgdesc="Comic book support for zathura"
arch=('i686' 'x86_64')
url="https://pwmt.org/projects/zathura-cb/"
license=('custom:zlib')
depends=('zathura' 'libarchive' 'desktop-file-utils')
makedepends=('git' 'meson' 'ninja')
conflicts=('zathura-cb')
provides=('zathura-cb')
source=(${_gitname}::git+https://git.pwmt.org/pwmt/zathura-cb.git#branch=develop)
md5sums=('SKIP')


pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  arch-meson build

  cd build
  ninja
}

package() {
  cd "$_gitname/build"

  DESTDIR="$pkgdir" ninja install
  install -Dm664 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
