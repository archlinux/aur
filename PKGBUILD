# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=piper-zhfix
_pkgname=piper
pkgver=0.7
pkgrel=1
pkgdesc='GTK application to configure gaming mice (zhfix fork)'
arch=('any')
url='https://github.com/detiam/piper-zhfix'
license=('GPL')
depends=('python' 'python-gobject' 'libratbag' 'python-evdev' 'python-lxml' 'python-cairo')
makedepends=('git' 'meson' 'flake8' 'appstream')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url#branch=zhfix")
sha512sums=('SKIP')

prepare() {
  cd $pkgname

  # Remove install script
  # This is handled by pacman hooks
  sed -i "/meson.add_install_script('meson_install.sh')/d" meson.build
}

build() {
  mkdir $pkgname/build
  cd $pkgname/build

  arch-meson ..

  ninja
}

package() {
  cd $pkgname/build

  DESTDIR="$pkgdir" ninja install
}
