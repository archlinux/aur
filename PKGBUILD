# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-polkit-agent-git
pkgver=0.1.4
pkgrel=1
pkgdesc='Pantheon Polkit Agent'
arch=('x86_64')
url='https://github.com/elementary/pantheon-agent-polkit'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'polkit')
makedepends=('cmake' 'cmake-modules-elementary-git' 'git' 'intltool' 'vala')
provides=('pantheon-polkit-agent')
conflicts=('pantheon-polkit-agent')
source=('pantheon-polkit-agent::git+https://github.com/elementary/pantheon-agent-polkit.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-polkit-agent

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

prepare() {
  cd pantheon-polkit-agent

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-polkit-agent/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd pantheon-polkit-agent/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
