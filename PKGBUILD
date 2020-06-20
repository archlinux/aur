# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

_name=img4tool
pkgname=$_name-git
pkgver=r182.22a2671
pkgrel=2
pkgdesc='Tool for manipulating IMG4, IM4M and IM4P files'
arch=('x86_64')
url="https://github.com/tihmstar/$_name"
license=('LGPL3')
depends=('libgeneral' 'libplist' 'openssl')
makedepends=('git' 'lzfse')
provides=("$_name")
conflicts=("$_name")
source=("git+$url.git"
        '0001-Update-libplist-name-for-2.2.0.patch')
sha256sums=('SKIP'
            '55c5355e9e15abda113ae84368e97d609e03a9d80e14101cd21585efc1bb8043')

pkgver() {
  cd "$_name"

  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_name"

  for p in "$srcdir"/*.patch; do
    patch -Np1 -i "$p"
  done
}

build() {
  cd "$_name"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_name"

  make DESTDIR="$pkgdir/" install
}
