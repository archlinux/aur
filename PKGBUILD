# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Alois Nespor <alois.nespor@gmail.com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=ogmrip-mpeg
pkgver=0.3
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="This plugin provides support for the Mpeg-1 and Mpeg-2 video codecs and the Mpeg container. It can be used to author DVDs, VCDs and SVCDs."
url="http://ogmrip.sourceforge.net/"
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip' 'mplayer' 'mjpegtools')
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/$pkgname-$pkgver.tar.gz"
	"http://sourceforge.net/projects/ogmrip/files/${pkgname}/${pkgver}/README")
build(){
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's/\(-Wall \)-Werror /\1/g' ./configure || return 1
  ./configure --prefix=/usr
  make
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/${pkgname}/README
}
md5sums=('c04f6ae45168147a15b04411c886d80e'
         '896ce3c5b3d041a06444297ad4034ef5')
