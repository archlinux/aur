# Maintainer:  Alexander Rødseth <rodseth@gmail.com>
# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>

pkgname=midori
pkgver=0.5.0
pkgrel=1
pkgdesc='Lightweight web browser based on Gtk WebKit'
arch=('x86_64' 'i686')
url='http://www.twotoasts.de/index.php?/pages/midori_summary.html'
license=('LGPL2.1')
install=midori.install
depends=('libzeitgeist' 'libwebkit' 'libnotify' 'libxss' 'libunique' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('libxml2' 'intltool' 'gtk-doc' 'librsvg' 'python2' 'vala' 'gcr')
optdepends=('gstreamer0.10-ugly-plugins: HTML5 videos support'
            'aria2: download utility')
options=('!emptydirs')
source=("http://archive.xfce.org/src/apps/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2")
sha256sums=('d280c19bb135f2b644a67d9f34d1ec1c148ceb14b5de11ce6c23f64c15be5df0')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr \
              --jobs=${MAKEFLAGS/-j/} \
              --enable-addons \
              --enable-unique \
              --enable-nls \
              --enable-docs \
              --enable-apidocs
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
