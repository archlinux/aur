# Maintainer: Alex (indigo@protonmail.com)
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <arch aur at jonw dot org>
# Contributor: sracker <smb.sac@gmail.com>

pkgname=xdebug7
provides=('xdebug7')
conflicts=('xdebug')
pkgver=3.0.2
pkgrel=2
pkgdesc="PHP debugging extension. For PHP7 package."
arch=('x86_64')
url="https://www.xdebug.org"
license=('GPL')
depends=('php7')
backup=('etc/php7/conf.d/xdebug.ini')
source=("https://xdebug.org/files/xdebug-${pkgver}.tgz"
	'xdebug.ini')
sha256sums=('096d46dec061341868d3e3933b977013a592e2e88992b2c0aba7fa52f87c4e17'
            '7c66883dc2ade69069ef84e30188b25630748aa9c8b0dd123727c00505421205')

build() {
  cd "$srcdir"/xdebug-${pkgver}
  phpize7
  ./configure --prefix=/usr --enable-xdebug
  make
}

package() {
  cd "$srcdir"/xdebug-${pkgver}
  make INSTALL_ROOT="$pkgdir" install
  install -D -m 644 "$srcdir"/xdebug.ini "$pkgdir"/etc/php7/conf.d/xdebug.ini
}
