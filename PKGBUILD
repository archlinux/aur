# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>
# Contributor: Carlos Mogas da Silva <r3pek@r3pek.org>
# Contributor: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname='budgie-screenshot-applet'
pkgver='0.4.3.r0.gd92b06c'
pkgrel='3'
pkgdesc='A Budgie applet for taking and uploading screenshots to Imgur and Imagebin.'
arch=('i686' 'x86_64')
url="https://github.com/cybre/${pkgname}"
license=('GPL2')
depends=('libpeas' 'budgie-desktop' 'json-glib' 'gnome-desktop' 'graphviz')
makedepends=('git' 'intltool' 'meson' 'ninja' 'vala' 'gobject-introspection')
source=("$pkgname"::"git+https://github.com/cybre/budgie-screenshot-applet.git#tag=v${pkgver:0:5}")
sha256sums=('SKIP')
changelog='CHANGELOG'

pkgver () {
  cd "$pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/; s/-/./g; s/^v//g'
}

prepare () {
  cd "$pkgname"

  git cherry-pick -n 1886d97 # Fix GTK+3.24 compilation issues
  git cherry-pick -n 0e0c582 # Fixes compilation errors with Vala 0.44
}

build () {
  arch-meson "$pkgname" build
  meson compile -C build
}

package () {
  meson install -C build --destdir "$pkgdir"
}
