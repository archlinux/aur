# Maintainer: Nicola Fontana <ntd@entidi.it>
#
# Former maintaining team:
# (Maintainer) Simon Doppler (dopsi) <dop.simon_at_gmail.com>
# (Contributor) Nick B <Shirakawasuna at gmail _dot_com>
# (Maintainer) moostik <mooostik_at_gmail.com>
pkgname=qelectrotech
pkgver=0.9
pkgrel=4
pkgdesc='An electric diagram editor'
arch=('i686' 'x86_64')
url='https://qelectrotech.org/'
license=('GPL2')
depends=('qt5-svg' 'hicolor-icon-theme' 'desktop-file-utils'
         'kwidgetsaddons5' 'kcoreaddons5')
optdepends=('tk: for qet_tb_generator support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qelectrotech/qelectrotech-source-mirror/archive/refs/tags/$pkgver.tar.gz"
        "install-dir.patch")
sha512sums=('cbca8a2cbf6e09f1f25cebd1b6d96bc7a1daec28d070e0782e9511f499eeb5d63809cda55da7f066d7f3cce72217972da1983dddf8d69f4e12108ca5a0e07a6e'
            '5731b050c2f92ec5c3d0374ffc6eeec27d1e816d06bd292b060d69bce799e33f251daee6cf744285b10531d52f72e9725d697ef14d0b20572a059c4e7b9f80b8')

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
