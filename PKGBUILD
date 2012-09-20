# Maintainer:  Alexander Rødseth <rodseth@gmail.com>
# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>

pkgname=midori
pkgver=0.4.7
pkgrel=1
pkgdesc='Lightweight web browser based on Gtk WebKit'
arch=('x86_64' 'i686')
url='http://www.twotoasts.de/index.php?/pages/midori_summary.html'
license=('LGPL2.1')
install=midori.install
depends=('libwebkit>=1.3.13' 'libunique' 'hicolor-icon-theme' 'desktop-file-utils' 'libnotify>=0.7.1' 'libxss')
makedepends=('libxml2' 'intltool' 'gtk-doc' 'librsvg' 'python2>=2.7.1' 'vala')
optdepends=('gstreamer0.10-ugly-plugins: HTML5 videos support')
options=('!emptydirs')
source=(http://archive.xfce.org/src/apps/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
md5sums=('06db7b88a41e9b2265728960d5e98f35')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  # python2 
  export PYTHON=/usr/bin/python2
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" wscript waf
  
  ./configure --prefix=/usr \
              --jobs=${MAKEFLAGS/-j/} \
              --enable-addons \
              --disable-hildon \
              --enable-unique \
              --enable-nls \
              --enable-docs \
              --enable-apidocs
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
