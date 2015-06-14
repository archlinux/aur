# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Alois Nespor <alois.nespor@gmail.com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=ogmrip-ac3
pkgver=0.3
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="This plugin enables transcoding to AC-3."
url="http://ogmrip.sourceforge.net/"
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip' 'mplayer' 'aften')
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/$pkgname-$pkgver.tar.gz"
	"http://sourceforge.net/projects/ogmrip/files/${pkgname}/${pkgver}/README"
)
build(){
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/\(-Wall \)-Werror /\1/g' ./configure || return 1

  ./configure --prefix=/usr
  make
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/ogmrip-ac3/README
}
md5sums=('e2fb08d4f01e60b388f7f73a81d54d80'
         '4010d2697f0b1916f56c9032cec49525')
