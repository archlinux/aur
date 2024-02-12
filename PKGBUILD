# Maintainer: Leadseason <admin@leadseason.eu>

pkgname=rofi-emoji-git
_pkgname=rofi-emoji
pkgver=r73.7f68772
pkgrel=1
pkgdesc='A Rofi plugin for selecting emojis'
url='https://github.com/Mange/rofi-emoji'
arch=('x86_64')
license=('MIT')
depends=('rofi')
checkdepends=('check')
optdepends=(
  'xsel: X11 support'
  'xclip: X11 support'
  'wl-clipboard: Wayland support'
)
makedepnds=(
  "git"
  "autoconf"
  "automake"
  "libtool"
)
conflicts=(${_pkgname})
source=(git+https://github.com/Mange/${_pkgname})
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd ${_pkgname}
  make check
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}/" install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
