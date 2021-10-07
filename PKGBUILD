# Maintainer: Tung Ha <tunght13488 at gmail dot com>
# Contributor: Alex <indigo at protonmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Jonathan Wiersma <arch aur at jonw dot org>
# Contributor: sracker <smb.sac at gmail dot com>

pkgname=xdebug7
provides=('xdebug')
pkgver=3.1.0
pkgrel=1
pkgdesc="PHP debugging extension. For PHP7 package."
arch=('x86_64')
url="https://www.xdebug.org"
license=('GPL')
depends=('php7')
backup=('etc/php7/conf.d/xdebug.ini')
source=("https://xdebug.org/files/xdebug-${pkgver}.tgz"
	'xdebug.ini')
sha256sums=('b956930adaef4a20e7573ad637a2f0e7f9a94ae2adaf122856bc8bf0d1e39d3a'
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
