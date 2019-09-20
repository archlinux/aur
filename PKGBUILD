# Maintainer: Simon Doppler (dopsi) <dop.simon_at_gmail.com>

# Former maintaining team :
# (Contributor) Nick B <Shirakawasuna at gmail _dot_com>
# (Maintainer) moostik <mooostik_at_gmail.com>
pkgname=qelectrotech
pkgver=0.7.0
pkgrel=1
epoch=1
pkgdesc="An electric diagram editor"
arch=('i686' 'x86_64')
url="https://qelectrotech.org/"
license=('GPL2')
depends=('qt5-svg' 'hicolor-icon-theme' 'desktop-file-utils' 'kwidgetsaddons'
'kcoreaddons' 'tk')
sha512sums=('7ed59203dbfeb8069fa9407ae8e7a6748c8c6bffddf9a64656477f8b4515587084e5ec908feddf67c589700e90577547114248d044c4b559827ba195d352201b'
            '37bda63af55fb422ab5c5950b229cc8a375295a43decffe31522c14e5dcc6dbeb9ca50a36ca40f595458af652cf1e0f46683a97c950b4745c12a1ddd31e28c57')
source=(
  "https://github.com/qelectrotech/qelectrotech-source-mirror/archive/$pkgver.tar.gz"
  'install-dir.patch'
)

_tarname="$pkgname-source-mirror-$pkgver"

prepare() {
  cd "$srcdir/$_tarname"
  patch -p1 < "$srcdir/install-dir.patch"
  sed -i 's/gzip \-9n/gzip -9nf/' "$srcdir/$_tarname/man/compress_man_pages.sh"
}

build() {
  cd "$srcdir/$_tarname"
  qmake-qt5
  make
}

package() {
  cd "$srcdir/$_tarname"
  make INSTALL_ROOT="$pkgdir" install
  mv "$pkgdir/usr/doc" "$pkgdir/usr/share/doc"
}

