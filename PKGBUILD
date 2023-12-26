# Maintainer:
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Trizen <trizenx at gmail dot com>
# Contributor: Federico Cinelli <cinelli.federico@gmail.com>

_pkgname="velox"
pkgname="$_pkgname-git"
pkgver=0.0.2.r287.gfcc0412
pkgrel=2
pkgdesc="Simple xcb window manager inspired by awesome, xmonad, and dwm"
url="https://github.com/michaelforney/velox"
license=('MIT')
arch=('i686' 'x86_64')

depends=(
  'swc'
  'wld'
  'libxkbcommon'
  'wayland'
  'libinput'
)
makedepends=('git')

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  tee config.mk <<EOF
PREFIX = /usr
LIBEXECDIR = /usr/lib
V = 1
EOF
}

build() {
  cd "$_pkgsrc"
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
