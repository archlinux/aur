# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-git
pkgver=r1211.cd4124e
pkgrel=1
pkgdesc='The Pantheon Control Center'
arch=('x86_64')
url='https://github.com/elementary/switchboard'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter-gtk' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so')
makedepends=('git' 'granite-git' 'intltool' 'meson' 'vala')
optdepends=('switchboard-plug-about-bzr: About plug'
            'switchboard-plug-default-applications-bzr: Default applications plug'
            'switchboard-plug-elementary-tweaks-bzr: Elementary tweaks plug'
            'switchboard-plug-keyboard-bzr: Keyboard plug'
            'switchboard-plug-pantheon-shell-bzr: Pantheon Shell plug'
            'switchboard-plug-power-bzr: Power plug')
provides=('switchboard' 'libswitchboard-2.0.so')
conflicts=('switchboard')
source=('git+https://github.com/elementary/switchboard.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson switchboard build \
    -Dlibunity='false'
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
