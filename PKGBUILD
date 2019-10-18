# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname='dynamic-wallpaper-editor'
pkgver='2.4'
pkgrel='1'
pkgdesc="A little utility for creation or edition of GNOME desktop's XML wallpapers"
changelog='CHANGELOG'
arch=('x86_64')
url="https://github.com/maoschanz/${pkgname}"
license=('GPL3')
depends=('python' 'hicolor-icon-theme')
makedepends=('meson' 'git')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

pkgver () {
  cd ${pkgname}
  git describe --tags | sed 's/-/.r/; s/-/./'
}

build () {
  arch-meson ${pkgname} build
  ninja -C build
}

package () {
  DESTDIR="${pkgdir}" ninja -C build install
}
