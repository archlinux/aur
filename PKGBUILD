# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-git
pkgver=6.0.2.r106.g697df721
pkgrel=1
pkgdesc='The Pantheon Control Center'
arch=('x86_64')
url='https://github.com/elementary/switchboard'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter-gtk' 'glib2' 'glibc' 'gtk3' 'libgee'
         'granite7' 'libhandy' 'libadwaita')
makedepends=('git' 'intltool' 'meson' 'vala' 'sassc')
optdepends=('switchboard-plug-about-git: About plug'
            'switchboard-plug-default-applications-git: Default applications plug'
            'switchboard-plug-elementary-tweaks-git: Elementary tweaks plug'
            'switchboard-plug-keyboard-git: Keyboard plug'
            'switchboard-plug-pantheon-shell-git: Pantheon Shell plug'
            'switchboard-plug-power-git: Power plug')
provides=('switchboard' 'libswitchboard-2.0.so')
conflicts=('switchboard')
source=('git+https://github.com/elementary/switchboard.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
