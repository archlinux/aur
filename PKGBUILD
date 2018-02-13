# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-music-git
pkgver=r3342.f2e6c45e
pkgrel=1
pkgdesc='The Pantheon Music Player'
arch=('x86_64')
url='https://github.com/elementary/music'
license=('GPL3')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gst-plugins-base-libs'
         'gstreamer' 'gtk3' 'json-glib' 'libaccounts-glib' 'libgda' 'libgee'
         'libgpod' 'libgsignon-glib' 'libpeas' 'libsoup' 'pango' 'taglib'
         'zeitgeist'
         'libgranite.so')
makedepends=('appstream' 'git' 'gobject-introspection' 'granite-git' 'intltool'
             'meson' 'vala')
optdepends=('gst-plugins-base: "Base" plugin libraries'
            'gst-plugins-good: "Good" plugin libraries'
            'gst-plugins-bad: "Bad" plugin libraries'
            'gst-plugins-ugly: "Ugly" plugin libraries'
            'gst-libav: Libav plugin')
provides=('pantheon-music')
conflicts=('pantheon-music')
source=('pantheon-music::git+https://github.com/elementary/music.git'
        'mesa-demos-conflict.patch'
        'noise-install-dirs.patch')
sha256sums=('SKIP'
            '9135fe677b0d61778a624ba211b545eb861468b500cfd161469aa28139ab1296'
            'd0ebc710a742d942e04a8df61d91dd75ae4b2aeafe7fece08f1fbc90c507f1df')

pkgver() {
  cd pantheon-music

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  arch-meson ../pantheon-music
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
