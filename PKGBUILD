# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=eaglemode
pkgver=0.96.4
pkgrel=1
pkgdesc="Visit almost everything in your PC simply by zooming in"
arch=('i686' 'x86_64')
url="http://eaglemode.sourceforge.net/"
license=('GPL-3.0-only')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libtiff'
         'libpng' 'librsvg' 'poppler-glib' 'xdg-utils' 'vlc' 'xz')
optdepends=('perl: Fetching stock market info for the emStocks plugin'
            'htmldoc: Rendering HTML documents'
            'pigz: Archive support'
            '7zip: Archive support')
makedepends=('perl')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('9f7b09b02a541c607225a2b8318012017a22c379d9717b34fc57035758933eb8')

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
