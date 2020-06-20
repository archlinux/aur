# Maintainer Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=elementary-icon-theme-git
pkgver=r2392.395d6a7e
pkgrel=1
pkgdesc='Named, vector icons for elementary OS'
arch=('any')
url='https://github.com/elementary/icons'
license=('GPL3')
groups=('pantheon-unstable')
depends=('hicolor-icon-theme')
makedepends=('git' 'meson' 'inkscape' 'xorg-xcursorgen')
provides=('elementary-icon-theme')
conflicts=('elementary-icon-theme')
options=('!emptydirs')
source=("elementary-icon-theme::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/elementary-icon-theme"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/elementary-icon-theme"
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd "${srcdir}/elementary-icon-theme/build"
  arch-meson ../
  ninja
}

package() {
  cd "${srcdir}/elementary-icon-theme/build"
  DESTDIR="${pkgdir}" ninja install
  rm "${pkgdir}"/.VolumeIcon*
}
# vim: ts=2 sw=2 et: