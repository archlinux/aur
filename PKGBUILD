# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Alois Nespor <alois.nespor@gmail.com>

pkgname=ogmrip-ac3
pkgver=0.3
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="This plugin enables transcoding to AC-3."
url="http://ogmrip.sourceforge.net/"
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip' 'mplayer' 'aften')
makedepends=(intltool)
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/$pkgname-$pkgver.tar.gz"
	"http://sourceforge.net/projects/ogmrip/files/${pkgname}/${pkgver}/README"
)
sha256sums=('80787cddfa11fc6a6758cc71abc58547d77a56f9f6ac9edd9d567ffad8577dc5'
            '2a279741a19acc8b9df86f22694cc74c92e4b97fa3459f7da4cbde4986b5b8f0')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/\(-Wall \)-Werror /\1/g' ./configure
  ./configure --prefix=/usr
  make
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/ogmrip-ac3/README
}
