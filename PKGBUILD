# Maintainer: Nicola Fontana <ntd@entidi.it>
#
# Former maintaining team:
# (Maintainer) Simon Doppler (dopsi) <dop.simon_at_gmail.com>
# (Contributor) Nick B <Shirakawasuna at gmail _dot_com>
# (Maintainer) moostik <mooostik_at_gmail.com>
pkgname=qelectrotech
pkgver=0.100
pkgrel=1
pkgdesc='An electric diagram editor'
arch=('i686' 'x86_64')
url='https://qelectrotech.org/'
license=('GPL-2.0-or-later')
depends=('qt5-svg' 'hicolor-icon-theme' 'desktop-file-utils'
         'kwidgetsaddons5' 'kcoreaddons5')
optdepends=('tk: for qet_tb_generator support')
source=("https://github.com/qelectrotech/qelectrotech-source-mirror/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "install-dir.patch")
sha512sums=('26b775262ae9dcc25166d6f57c11851fd0152a9f269f1cc4fd4897d11aa17621d895e49fd0d85a92149a7f653f8a42295ba2938db1a85dee8b643854ba720736'
            '5731b050c2f92ec5c3d0374ffc6eeec27d1e816d06bd292b060d69bce799e33f251daee6cf744285b10531d52f72e9725d697ef14d0b20572a059c4e7b9f80b8')

_tarname="$pkgname-$pkgver"


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
