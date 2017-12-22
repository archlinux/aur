# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-geoclue2-agent-git
pkgver=r78.3546705
pkgrel=1
pkgdesc='Pantheon Geoclue2 Agent'
arch=('x86_64')
url='https://github.com/elementary/pantheon-agent-geoclue2'
license=('GPL3')
groups=('pantheon-unstable')
depends=('dbus-glib' 'glib2' 'glibc' 'gtk3' 'geoclue2')
makedepends=('cmake' 'cmake-modules-elementary-git' 'git' 'intltool' 'vala')
provides=('pantheon-geoclue2-agent')
conflicts=('pantheon-geoclue2-agent')
source=('pantheon-geoclue2-agent::git+https://github.com/elementary/pantheon-agent-geoclue2.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-geoclue2-agent

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd pantheon-geoclue2-agent

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-geoclue2-agent/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd pantheon-geoclue2-agent/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
