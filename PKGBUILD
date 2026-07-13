# Maintainer: aur.chaotic.cx
# Contributor: Christian Boxdörfer <christian.boxdoerfer@posteo.de>

_pkgname="fsearch"
pkgname="$_pkgname"
pkgver=0.3
pkgrel=1
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
  'glib2-devel'
  'itstool'
  'meson'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/$pkgver.$_pkgext")
sha256sums=('17e9bb26f0c6077192dc1f40800c5c2e6074d93ef0e7f95b42180eb6b143b556')

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
