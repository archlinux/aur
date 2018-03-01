# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=corebird
pkgver=1.7.4
pkgrel=1
pkgdesc="Native Gtk+ Twitter Client"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url="https://corebird.baedert.org/"
depends=('gtk3>=3.20'
     'gettext>=0.19.7'
     'glib2>=2.44'
     'sqlite3'
     'libtool'
     'libsoup>=2.4'
     'json-glib'
     'intltool>=0.40'
     'gstreamer>=1.6'
     'gst-plugins-base'
     'gst-plugins-good'
     'gst-plugins-bad'
     'gst-libav'
     'gspell>=1.0'
     'librsvg')
optdepends=('noto-fonts-emoji: Emoji support'
            'ttf-emojione: Emoji support')
makedepends=('vala>=0.28' 'meson')
source=("https://github.com/baedert/corebird/archive/${pkgver}.tar.gz")
sha256sums=('8d3facfbad0f1128bc77be517c0bcbcfe1be19698c05fc0a32402f98939dabb1')
conflicts=('corebird-git')

build() {
  cd ${pkgname}-${pkgver}

  sed -i -e "s|buildtype=debug|buildtype=release|g" meson.build
  meson builddir --prefix=/usr -D VIDEO=yes -D SPELLCHECK=yes
  ninja -C builddir
}

package() {
  cd ${pkgname}-${pkgver}

  DESTDIR="${pkgdir}" ninja -C builddir install
}
