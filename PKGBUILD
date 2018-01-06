# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=cchost
pkgver=5.1
_getid3ver=1.9.3-20111213
pkgrel=2
pkgdesc="Web-based System Supporting Remixing and Collaboration on Media"
arch=(any)
url="http://wiki.creativecommons.org/CcHost"
license=('GPL')
depends=('php')
install=cchost.install
backup=('etc/webapps/cchost/.htaccess')
options=('!strip')
source=(http://downloads.sourceforge.net/cctools/cchost-$pkgver.zip
	http://downloads.sourceforge.net/sourceforge/getid3/getid3-${_getid3ver}.zip)
md5sums=('723ed665a52b2b666811499b13f7dfe2'
         '00990e23f4035c29974d025cc5f3eeb7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix
  sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' bin/publishcchost
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir"/usr/share/webapps
  mkdir -p "$pkgdir"/etc/webapps/cchost
  cp -a "$srcdir"/$pkgname-$pkgver "$pkgdir"/usr/share/webapps/cchost
  cp -a "$srcdir"/getid3 "$pkgdir"/usr/share/webapps/cchost/getid3

  cd "$pkgdir"/usr/share/webapps/cchost

  echo "deny from all" >"$pkgdir"/etc/webapps/cchost/.htaccess
  ln -s /etc/webapps/cchost/.htaccess .htaccess

  find "$pkgdir"/usr/share/webapps/cchost -type f -exec chmod 0644 {} \;
}
