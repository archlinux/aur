# Maintainer: erik-pro <aarnaarn2@gmail.com>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
pkgname=emacspeak
pkgver=49.0
pkgrel=0
pkgdesc="Emacs extension that provides spoken output"
arch=('x86_64')
url="http://emacspeak.sf.net/"
license=('GPL' 'LGPL' 'APACHE')
depends=(emacs
	 'tcl>=8.6'
	 'tclx'
	 'lesstif'
	 'espeak')
optdepends=('python: Google client, and wrapper for Emacspeak speech servers.')
install='emacspeak.install'
source=("https://github.com/tvraman/emacspeak/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('24a73d020c434e539ac88ea2041898b6')

prepare() {
  export DTK_PROGRAM="espeak"
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's|/etc/info-dir|$(DESTDIR)/etc/info-dir|g' info/Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make config
  make
  # Espeak isn't compiled by default, but lots of folks use it.
  make espeak
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="${pkgdir}/usr" install
}

