# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

_name=img4tool
pkgname=$_name-git
pkgver=r168.dd53076
pkgrel=1
pkgdesc='Tool for manipulating IMG4, IM4M and IM4P files'
arch=('x86_64')
url="https://github.com/tihmstar/$_name"
license=('LGPL3')
depends=('libgeneral' 'libplist' 'openssl')
makedepends=('git' 'lzfse')
provides=("$_name")
conflicts=("$_name")
source=("git+$url.git"
        '0001-Fix-31-add-missing-algorithm-header.patch'
        '0002-Add-missing-algorithm-header-to-main.cpp.patch')
sha256sums=('SKIP'
            '656580f345b286f2f9b5c1b91e2a819b2dea580cb3a9b4a22ccb4befd7ea42b0'
            'd95f9c542b65b36df5ebf7cf3ed374222cc77ad92235cb0a98e986e964e36fff')

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
