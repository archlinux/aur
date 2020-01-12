# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=ocrfeeder
pkgver=0.8.1+87+g8615aff
pkgrel=1
pkgdesc="GTK+ document layout analysis and optical character recognition application"
arch=('any')
url="https://wiki.gnome.org/Apps/OCRFeeder"
license=('GPL')
depends=('ghostscript' 'goocanvas' 'gtk3' 'gtkspell3' 'iso-codes' 'python-gobject' 'python-odfpy'
         'python-pillow' 'python-pyenchant' 'python-reportlab' 'python-sane' 'unpaper')
makedepends=('git' 'gnome-common')
optdepends=('tesseract: character recognition'
            'ocrad: character recognition'
            'gocr: character recognition'
            'cuneiform: character recognition')
_commit=8615aff3966dbfe24ed45eed6d34dc9b4e6b4e90  # master
source=("git+https://gitlab.gnome.org/GNOME/ocrfeeder.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^release_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

check() {
  make -C $pkgname check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 resources/icons/org.gnome.OCRFeeder.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.gnome.OCRFeeder.svg"
}
