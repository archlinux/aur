# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=corebird
pkgver=1.7.2
pkgrel=1
pkgdesc="Native Gtk+ Twitter Client"
arch=('i686' 'x86_64')
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
            'emojione-fonts: Emoji support')
makedepends=('vala>=0.28' 'meson')
source=(https://github.com/baedert/corebird/archive/${pkgver}.tar.gz)
sha256sums=('dabaafa812924e40c9046d99cd547727ed2b520afb4a0f10eb4cca8f90e145e3')
conflicts=('corebird-git')

build() {
  cd ${pkgname}-${pkgver}

  meson builddir --prefix=/usr -D VIDEO=yes -D SPELLCHECK=yes
  ninja -C builddir
}

package() {
  cd ${pkgname}-${pkgver}

  DESTDIR="${pkgdir}" ninja -C builddir install
}
