# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Francesco Groccia <frgroccia gmail.com>
# Contributor: Jakub "mr.MikyMaus" Fiser <mr@MikyMaus.org>

pkgname=clawsker
pkgver=1.3.5
pkgrel=1
pkgdesc="An applet to edit Claws Mail's hidden preferences."
arch=('any')
url="https://www.claws-mail.org/clawsker.php"
license=('GPL3')
makedepends=('gettext')
depends=('perl-gtk3' 'perl-locale-gettext' 'perl-file-which' 'claws-mail')
validpgpkeys=('43BC364B16DF0C205EBD75921F0F0A88DE5BCCA6') # Ricardo Mones Lastra <ricardo@mones.org>
source=("https://www.claws-mail.org/tools/$pkgname-$pkgver.tar.xz"{,.asc})
md5sums=('39254b5a380711c7dea4a573fff0d4e2'
         'SKIP')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # race condition fixed upstream
  # TODO: remove '-j1' for next release
  make -j1 PREFIX="/usr" DESTDIR="$pkgdir" install
}
