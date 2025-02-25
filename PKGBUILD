# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

_pkgname=peek
pkgname=peek-webp
pkgver=1.5.1
pkgrel=1
pkgdesc='Simple screen recorder with an easy to use interface'
arch=('x86_64')
url='https://github.com/detiam/peek'
license=('GPL-3.0-or-later')
conflicts=("$_pkgname")
provides=("$_pkgname")
depends=('gtk3' 'libkeybinder3' 'ffmpeg' 'which')
makedepends=('git' 'meson' 'vala' 'appstream-glib' 'txt2man'
             'gst-plugin-gtk' 'gst-plugins-ugly')
checkdepends=('xorg-server-xvfb')
optdepends=('gst-plugin-gtk: Recording under Gnome Shell'
            'gst-plugins-ugly: MP4 output under Gnome Shell'
            'gifski: High quality GIF animations with thousands of colors')
source=("git+$url.git#commit=afede21e1c799320218f99d4327e45d939acd843")
sha256sums=('ea2201a1a36c8fdea33af77dd427a9527ae472d3bc50fb6807417b716127c435')

build() {
  mkdir $_pkgname/build
  cd $_pkgname/build

  arch-meson \
    -D enable-filechoosernative=true \
    -D enable-keybinder=enabled \
    ..

  ninja
}

check() {
  cd $_pkgname/build

  xvfb-run meson test
}

package() {
  cd $_pkgname/build

  DESTDIR="$pkgdir" ninja install
}

