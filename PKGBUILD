# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=elementary-icon-theme-git
pkgver=6.0.0.r4.g9c8e5b0f
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
  # https://wiki.archlinux.org/title/VCS_package_guidelines#Git
  # Upstream has annotated tags
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
