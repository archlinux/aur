# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>
# Contributor: Carlos Mogas da Silva <r3pek@r3pek.org>
# Contributor: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname='budgie-screenshot-applet'
pkgver='0.4.3.r0.gd92b06c'
pkgrel='1'
pkgdesc='A Budgie applet for taking and uploading screenshots to Imgur and Imagebin.'
arch=('i686' 'x86_64')
url="https://github.com/cybre/${pkgname}"
license=('GPL2')
depends=('libpeas' 'budgie-desktop' 'json-glib' 'gnome-desktop')
makedepends=('intltool' 'meson' 'ninja' 'vala' 'gobject-introspection')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
changelog='CHANGELOG'

pkgver () {
  cd ${pkgname}

  git describe --long --tags | sed 's/v//; s/-/.r/; s/-/./'
}

prepare () {
  cd ${pkgname}

  git cherry-pick -n 1886d97 # Fix GTK+3.24 compilation issues
  git cherry-pick -n 0e0c582 # Fixes compilation errors with Vala 0.44
}

build () {
  arch-meson ${pkgname} build
  ninja -C build
}

package () {
  DESTDIR="${pkgdir}" ninja -C build install
}
