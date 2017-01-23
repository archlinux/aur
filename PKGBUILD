# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Vladimir Kutyavin <vlkut-at-bk-dot-ru>

pkgname=psimedia
pkgver=20121205
pkgrel=1
pkgdesc="Voice and video chat plugin for Psi-like IM clients.  The implementation is based on GStreamer."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://delta.affinix.com/psimedia/"
depends=('psi' 'speex' 'gstreamer0.10-base' 'qt4' 'gstreamer0.10-good-plugins'
	 'liboil')
makedepends=('pkgconfig' 'gdb' 'git')
source=("$pkgname::git://github.com/psi-im/psimedia.git#commit=4918a1cc5e9489b4960c25b473fbd324f6cebc86")
md5sums=('SKIP')

build() {
  cd "$srcdir"/$pkgname
  cat >>gstprovider/gstconf.pri <<EOF
	INCLUDEPATH += \
		/usr/include/gstreamer-0.10 \
		/usr/include/glib-2.0 \
		/usr/lib/glib-2.0/include \
		/usr/include/libxml2
EOF
  qmake-qt4
  make
}

package() {
  cd "$srcdir"/$pkgname
  install -D -m644 "$srcdir"/$pkgname/gstprovider/libgstprovider.so "$pkgdir"/usr/lib/psi/plugins/libgstprovider.so
}
