# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_pkgname=igetnonce
pkgname=$_pkgname-s0uthwest-git
pkgver=r10.6443eb5
pkgrel=1
pkgdesc="Tool for checking booted iOS device nonces - s0uthwest's fork - git version"
arch=('x86_64')
url="https://github.com/s0uthwest/$_pkgname"
license=('unknown')
depends=('libimobiledevice' 'libirecovery' 'libplist')
makedepends=('git')
provides=('igetnonce' 'igetnonce-s0uthwest')
conflicts=('igetnonce')
source=("git+$url.git"
        '0001-Fix-incorrect-language-standard.patch')
sha512sums=('SKIP'
            'b89addf41d8b4012d501961a8e95e80a62ba35467d7b36fd52bc1e32601fb3e39359185771156ed292e7c2489e0d7c057563db8fccfee712cd57fa696f7ea826')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"

  for p in "$srcdir"/*.patch; do
    patch -Np1 -i "$p"
  done
}

build() {
  cd "$_pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
