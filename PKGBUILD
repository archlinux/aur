# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=aylurs-gtk-shell-git
_pkgname=ags
pkgver=2.3.0.r58.g5ee4f3c
pkgrel=1
pkgdesc="Aylurs's Gtk Shell (AGS), An eww inspired gtk widget system."
arch=('x86_64')
url="https://github.com/Aylur/ags"
license=('GPL-3.0-only')
makedepends=('git' 'meson' 'go')
depends=('gjs'
         'gobject-introspection'
        )
optdepends=('libastal-meta'
            'blueprint-compiler'
            'dart-sass'
            'npm'
           )
source=(
  "git+${url}.git"
  "git+https://github.com/Aylur/gnim.git"
  )
sha256sums=('SKIP' 'SKIP')
provides=('aylurs-gtk-shell')
conflicts=('aylurs-gtk-shell')

pkgver(){
  cd $srcdir/$_pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  git submodule init
  git config submodule.lib/gnim.url "$srcdir/gnim"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $srcdir/$_pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd $srcdir/$_pkgname
  meson install -C build --destdir "$pkgdir"
}


