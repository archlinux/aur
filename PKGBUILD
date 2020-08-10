# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-git
pkgver=2.4.0.r25.gb406b3d
pkgrel=1
pkgdesc='The Pantheon Control Center'
arch=('x86_64')
url='https://github.com/elementary/switchboard'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter-gtk' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libhandy1')
makedepends=('git' 'granite' 'intltool' 'meson' 'vala')
optdepends=('switchboard-plug-about-git: About plug'
            'switchboard-plug-default-applications-git: Default applications plug'
            'switchboard-plug-elementary-tweaks-git: Elementary tweaks plug'
            'switchboard-plug-keyboard-git: Keyboard plug'
            'switchboard-plug-pantheon-shell-git: Pantheon Shell plug'
            'switchboard-plug-power-git: Power plug')
provides=('switchboard' 'libswitchboard-2.0.so')
conflicts=('switchboard')
source=('git+https://github.com/elementary/switchboard.git'
        '0001-libhandy1-support.patch')
sha256sums=('SKIP'
            '0963caab95c40cb9e538316eb5da2bd6e0614d570d887db13f3ff76e78fa9ed4')

pkgver() {
  cd switchboard

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd switchboard
  patch -Np1 -i ../0001-libhandy1-support.patch
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
