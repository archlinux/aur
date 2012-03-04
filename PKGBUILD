# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>

pkgname=midori
pkgver=0.4.3
pkgrel=1
pkgdesc="A lightweight web browser based on Gtk WebKit"
arch=('i686' 'x86_64')
url="http://www.twotoasts.de/index.php?/pages/midori_summary.html"
license=('LGPL2.1')
install=midori.install
depends=('libwebkit>=1.3.13' 'libunique' 'hicolor-icon-theme' 'desktop-file-utils' 'libnotify>=0.7.1' 'libxss')
makedepends=('libxml2' 'intltool' 'gtk-doc' 'librsvg' 'python2>=2.7.1' 'vala') # 'git'
optdepends=('vala: for use in extensions')
source=(http://archive.xfce.org/src/apps/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
md5sums=('900037557b82818d79d2dd1c5a7d7fd2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # python2 
  export PYTHON=/usr/bin/python2
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" wscript waf
  
  ./configure --prefix=/usr --jobs=${MAKEFLAGS/-j/} \
	--enable-addons \
	--disable-hildon \
	--enable-unique \
	--enable-nls \
	--enable-docs \
	--enable-apidocs
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
