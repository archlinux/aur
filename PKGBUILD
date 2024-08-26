# Maintainer:
# Contributor: Christian Boxdörfer <christian.boxdoerfer@posteo.de>

## links
# https://cboxdoerfer.github.io/fsearch
# https://github.com/cboxdoerfer/fsearch

_pkgname="fsearch"
pkgname="$_pkgname"
pkgver=0.2.3
pkgrel=3
pkgdesc="A fast graphical file search utility"
url="https://github.com/cboxdoerfer/fsearch"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'gtk3'
  'libicuuc.so'
  'pcre2'
)
makedepends=(
  'git'
  'meson'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/$pkgver.$_pkgext")
sha256sums=('b3c576bf1230da7c374d00bb32d72686b940b4dee80d941495acfdd5437bf117')

build() {
  local _meson_options=(
    -Dchannel=AUR-stable
  )

  arch-meson "${_meson_options[@]}" "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
