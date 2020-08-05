# Maintainer:zocker_160 <zocker1600 at posteo dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: dcraven <dcraven@gmail.com>
# Contributor: Roberto Nobrega <rwnobrega@gmail.com>

pkgname=bless-git
_gitname=bless
pkgver=r181.59aaaba
pkgrel=1
pkgdesc="High-quality, full-featured hex editor (git version)"
arch=('any')
url="https://github.com/afrantzis/bless"
license=('GPL2')
depends=('gtk-sharp-2' 'mono')
conflicts=('bless')
makedepends=('libxslt' 'meson')
source=("git://github.com/afrantzis/bless.git"
        "bless_bin")
sha256sums=('SKIP'
            'b114dd9045c1fc2cfbaba5ff1aa02864429916a5356db71ed8b7e740d2352e07')

pkgver() {
  cd ${srcdir}/${_gitname}/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/${_gitname}
  meson setup build -Dprefix="${pkgdir}" -Dtests=false --buildtype=release
}

build() {
  cd ${srcdir}/${_gitname}
  ninja -C build
}

package() {
  cd ${srcdir}/${_gitname}
  ninja -C build install
  
  rm "${pkgdir}/bin/bless"
  cp "${srcdir}/bless_bin" "${pkgdir}/bin/bless"
}
