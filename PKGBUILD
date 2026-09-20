# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=ibus-cangjie
pkgver=2.5
pkgrel=1
pkgdesc="This is an IBus engine for users of the Cangjie and Quick input methods."
arch=('any')
url="https://cangjie.pages.freedesktop.org/projects/ibus-cangjie/"
license=('GPL-3.0-or-later')
depends=('ibus' 'gtk3' 'gsound' 'python-pycangjie>=1.5' 'python>=3.10' 'python-gobject')
makedepends=('git' 'meson' 'ninja' 'gobject-introspection' 'gettext')
checkdepends=('python-coverage')
install='ibus-cangjie.install'
_commit='2.5'
source=("git+https://gitlab.freedesktop.org/cangjie/$pkgname.git#tag=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  meson setup build --prefix=/usr --buildtype=plain
}

build() {
  meson compile -C "$srcdir/$pkgname/build"
}

check() {
  meson test -C "$srcdir/$pkgname/build" --print-errorlogs
}

package() {
  meson install -C "$srcdir/$pkgname/build" --destdir "$pkgdir"
}
