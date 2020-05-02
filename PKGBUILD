# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=theoraplay-hg
pkgver=67
pkgrel=1
pkgdesc='library used by games to play Theora videos'
arch=('x86_64')
url='https://icculus.org/theoraplay/'
license=('custom:zlib')
makedepends=('mercurial')
provides=('theoraplay')
conflicts=('theoraplay')

source=("hg+https://hg.icculus.org/icculus/theoraplay"
        'meson.patch')
md5sums=('SKIP'
         'c9626328d164758e6cf487d2631c6864')

pkgver() {
  cd theoraplay
  hg identify -n
}

prepare() {
  cd theoraplay
  hg patch ../meson.patch
  meson --prefix=/usr --buildtype=release build
}

build() {
  cd theoraplay/build
  ninja
}

package() {
  cd theoraplay/build
  DESTDIR="$pkgdir" ninja install
}

# vim:set ts=2 sts=2 sw=2 et:
