# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=libcangjie
pkgver=1.4.0
pkgrel=1
_commit=98241ed512cc10e33b4b023b3022780efc49182c
pkgdesc="CangJie Input Method Library"
arch=('x86_64' 'i686')
url="https://cangjie.pages.freedesktop.org/projects/libcangjie/"
license=('LGPL3')
depends=('sqlite')
makedepends=('git' 'meson>=1.3.2' 'ninja' 'gettext' 'pkgconf' 'cmake')
replaces=('libcangjie-git')
sha256sums=('SKIP')
source=("${pkgname}::git+https://gitlab.freedesktop.org/cangjie/${pkgname}.git#commit=${_commit}")



build() {
  cd "$srcdir/$pkgname"
  meson setup build --prefix=/usr --buildtype=plain
  meson compile -C build
}

check() {
  meson test -C "$srcdir/$pkgname/build" --print-errorlogs
}

package() {
  meson install -C "$srcdir/$pkgname/build" --destdir "$pkgdir"
}
