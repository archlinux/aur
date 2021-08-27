# Maintainer: Nicola Fontana <ntd@entidi.it>
#
# Former maintaining team:
# (Maintainer) Simon Doppler (dopsi) <dop.simon_at_gmail.com>
# (Contributor) Nick B <Shirakawasuna at gmail _dot_com>
# (Maintainer) moostik <mooostik_at_gmail.com>
pkgname=qelectrotech
pkgver=0.8.0
pkgrel=1
pkgdesc='An electric diagram editor'
arch=('i686' 'x86_64')
url='https://qelectrotech.org/'
license=('GPL2')
depends=('qt5-svg' 'hicolor-icon-theme' 'desktop-file-utils'
         'kwidgetsaddons' 'kcoreaddons')
optdepends=('tk: for qet_tb_generator support')
source=("https://github.com/qelectrotech/$pkgname-source-mirror/archive/refs/tags/$pkgver.tar.gz"
        "install-dir.patch")
sha512sums=('e382c659474d42478c19cfa04ea77e1f013a4a40157d813e789607bbdf8d008d850c8c67bf81a62ecf3e1d0a6b4a9715d5e728fba65ac00a56dfaa4b88343e21'
            '9bf61fdc56f95547799962b8010ee2b147aed4707bf6b66bf7c382d11c9a88d7e102f94aa9c562eff01ca17da7f35e2a318495faabb082005cd338bfde3badb4')

_tarname="$pkgname-source-mirror-$pkgver"


prepare() {
  cd "$srcdir/$_tarname"
  patch -p1 < "$srcdir/install-dir.patch"
  sed -i 's/gzip \-9n/gzip -9nf/' "man/compress_man_pages.sh"
}

build() {
  cd "$srcdir/$_tarname"
  qmake-qt5
  make
}

package() {
  cd "$srcdir/$_tarname"
  make INSTALL_ROOT="$pkgdir" install
}
