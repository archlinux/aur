# Maintainer: Nicola Fontana <ntd@entidi.it>
#
# Former maintaining team:
# (Maintainer) Simon Doppler (dopsi) <dop.simon_at_gmail.com>
# (Contributor) Nick B <Shirakawasuna at gmail _dot_com>
# (Maintainer) moostik <mooostik_at_gmail.com>
pkgname=qelectrotech
pkgver=0.8.0
pkgrel=2
pkgdesc='An electric diagram editor'
arch=('i686' 'x86_64')
url='https://qelectrotech.org/'
license=('GPL2')
depends=('qt5-svg' 'hicolor-icon-theme' 'desktop-file-utils'
         'kwidgetsaddons' 'kcoreaddons')
optdepends=('tk: for qet_tb_generator support')
source=("https://git.tuxfamily.org/qet/qet.git/snapshot/qet-$pkgver.tar.gz"
        "install-dir.patch")
sha512sums=('732101130e77849ed0a56bcc7b519a1ca032e8f203951a50e1dd5fd488e96f1ab69ed0854176604f1947636b3d8fda1ac8aebbcfe01e63dfa263d8f646224f53'
            '9bf61fdc56f95547799962b8010ee2b147aed4707bf6b66bf7c382d11c9a88d7e102f94aa9c562eff01ca17da7f35e2a318495faabb082005cd338bfde3badb4')

prepare() {
  cd "$srcdir/qet-$pkgver"
  patch -p1 < "$srcdir/install-dir.patch"
  sed -i 's/gzip \-9n/gzip -9nf/' "man/compress_man_pages.sh"
}

build() {
  cd "$srcdir/qet-$pkgver"
  qmake-qt5
  make
}

package() {
  cd "$srcdir/qet-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}
