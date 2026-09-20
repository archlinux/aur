# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=python-pycangjie
pkgver=1.5.0
pkgrel=1
pkgdesc="This is a Python wrapper to libcangjie, the library implementing Cangjie and Quick input methods."
arch=('x86_64')
url="https://gitlab.freedesktop.org/cangjie/pycangjie"
license=('LGPL3')
depends=('libcangjie' 'python')
makedepends=('cython' 'git' 'meson' 'ninja' 'python-setuptools')
replaces=('pycangjie-git')

# Latest upstream release (v1.5.0). Replace with the resolved commit SHA on update.
_commit='1.5.0'
source=("$pkgname::git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  meson setup "$srcdir/$pkgname/build" "$srcdir/$pkgname" --prefix=/usr --buildtype=plain
  meson compile -C "$srcdir/$pkgname/build"
}

check() {
  meson test -C "$srcdir/$pkgname/build" --print-errorlogs
}

package() {
  meson install -C "$srcdir/$pkgname/build" --destdir "$pkgdir"
}
