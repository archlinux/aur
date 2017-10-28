# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=corebird
pkgver=1.7.1
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
     'noto-fonts-emoji'
     'librsvg')
makedepends=('vala>=0.28' 'meson')
source=(https://github.com/baedert/corebird/archive/${pkgver}.tar.gz)
sha256sums=('3fa248b4e00b3975f92995031d7c2659954cf8ef212c2c699b5ff409f4100edd')
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
