# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sh4nks <sh4nks7@gmail.com

pkgname=lightdm-pantheon-greeter-git
pkgver=3.3.1.r49.1d9d995
pkgrel=1
pkgdesc='Pantheon greeter for LightDM'
arch=('x86_64')
url='https://github.com/elementary/greeter'
license=('GPL')
groups=('pantheon-unstable')
depends=('cairo' 'clutter' 'clutter-gtk' 'gdk-pixbuf2' 'glib2' 'gtk3' 'libgee'
         'libgl' 'libx11' 'lightdm'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('meson' 'git' 'granite-git' 'libglvnd' 'libxfixes' 'vala'
             'wingpanel-git')
provides=('lightdm-pantheon-greeter')
conflicts=('lightdm-pantheon-greeter')
install='lightdm-pantheon-greeter.install'
source=('lightdm-pantheon-greeter::git+https://github.com/elementary/greeter.git')
sha256sums=('SKIP')

pkgver() {
  cd lightdm-pantheon-greeter

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  arch-meson lightdm-pantheon-greeter build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
