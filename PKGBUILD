# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-polkit-agent-git
pkgver=0.1.4.r19.9d023ae
pkgrel=1
pkgdesc='Pantheon Polkit Agent'
arch=('x86_64')
url='https://github.com/elementary/pantheon-agent-polkit'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'polkit')
makedepends=('git' 'intltool' 'meson' 'vala')
provides=('pantheon-polkit-agent')
conflicts=('pantheon-polkit-agent')
source=('pantheon-polkit-agent::git+https://github.com/elementary/pantheon-agent-polkit.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-polkit-agent

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  arch-meson ../pantheon-polkit-agent
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
