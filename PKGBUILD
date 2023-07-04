# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=eaglemode
pkgver=0.96.1
pkgrel=1
pkgdesc="Visit almost everything in your PC simply by zooming in"
arch=('i686' 'x86_64')
url="http://eaglemode.sourceforge.net/"
license=('GPL3')
depends=('desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'libtiff'
         'libpng' 'librsvg' 'poppler-glib' 'xdg-utils' 'xine-lib' 'xz')
optdepends=('perl: Fetching stock market info for the emStocks plugin')
makedepends=('perl')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('14884270c821ccb83b39d72ca2ef61070ee421aa8b55414400a524f6ec1134dc')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  perl make.pl build continue=yes
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  perl make.pl install dir=/opt/$pkgname root="${pkgdir}" menu=yes bin=yes

# icons
  install -Dm644 "${srcdir}"/$pkgname-$pkgver/res/icons/${pkgname}32.png \
    "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/$pkgname.png
  install -Dm644 "${srcdir}"/$pkgname-$pkgver/res/icons/${pkgname}48.png \
    "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/$pkgname.png
}
