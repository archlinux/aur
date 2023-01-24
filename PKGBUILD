# Maintainer: Nicola Fontana <ntd@entidi.it>
#
# Former maintaining team:
# (Maintainer) Simon Doppler (dopsi) <dop.simon_at_gmail.com>
# (Contributor) Nick B <Shirakawasuna at gmail _dot_com>
# (Maintainer) moostik <mooostik_at_gmail.com>
pkgname=qelectrotech
pkgver=0.9.0
pkgrel=1
pkgdesc='An electric diagram editor'
arch=('i686' 'x86_64')
url='https://qelectrotech.org/'
license=('GPL2')
depends=('qt5-svg' 'hicolor-icon-theme' 'desktop-file-utils'
         'kwidgetsaddons' 'kcoreaddons')
optdepends=('tk: for qet_tb_generator support')
source=("https://git.tuxfamily.org/qet/qet.git/snapshot/qet-$pkgver.tar.gz"
        "install-dir.patch")
sha512sums=('746e47eba5fe061056308255933352ce385db4c2e7a0f8a6850930a120609fbfdd141763fb410aca159347a65f6f5612b27d5679cfcb72f26d6564c4db66a3f2'
            '5731b050c2f92ec5c3d0374ffc6eeec27d1e816d06bd292b060d69bce799e33f251daee6cf744285b10531d52f72e9725d697ef14d0b20572a059c4e7b9f80b8')

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
