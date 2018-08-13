# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sh4nks <sh4nks7@gmail.com

pkgname=lightdm-pantheon-greeter-git
pkgver=r874.23ef62e
pkgrel=1
pkgdesc='Pantheon greeter for LightDM'
arch=('x86_64')
url='https://github.com/elementary/greeter'
license=('GPL')
groups=('pantheon-unstable')
depends=('cairo' 'clutter' 'clutter-gtk' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'libgee' 'libgl' 'libx11' 'lightdm'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('meson' 'git' 'granite-git' 'libglvnd' 'libxfixes' 'vala'
             'wingpanel-git')
provides=('lightdm-pantheon-greeter')
conflicts=('lightdm-pantheon-greeter')
install='lightdm-pantheon-greeter.install'
source=('lightdm-pantheon-greeter::git+https://github.com/elementary/greeter.git'
        '0001-bin-not-sbin.patch')
sha256sums=('SKIP'
            'f1fd5a443caa80cf95ee36a05421f3418cb1bc86714e47f1314c61128b77054b')

pkgver() {
  cd lightdm-pantheon-greeter

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  cd lightdm-pantheon-greeter

  patch -Np1 -i ../0001-bin-not-sbin.patch
}

build() {
  cd build

  arch-meson ../lightdm-pantheon-greeter
}

package() {
  build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
