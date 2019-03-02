# Maintainer: nic96
pkgname=linuxtrack-bin
provides=("linuxtrack")
conflicts=("linuxtrack")
pkgver=0.99.18
pkgrel=1
pkgdesc="Linuxtrack is a project aiming to bring head tracking to Linux and Mac."
url="https://github.com/uglyDwarf/linuxtrack"
license=('MIT')
arch=('i686' 'x86_64')
depends=('libusb' 'v4l-utils' 'zlib' 'mxml' 'qt4' 'qtwebkit'  'cwiid' 'opencv')
urlarch=${CARCH/x86_/}
urlarch=${urlarch/i686/32}
source=("http://linuxtrack.eu/repositories/universal/linuxtrack-0.99.18-$urlarch.zip")
md5sums=('aac1e5c89b0ef339954ddeb2c4d7b9e3')

package() {
  cd "$srcdir"
  mkdir $pkgdir/opt
  mkdir $pkgdir/usr
  tar xf ${pkgname/-bin/}-${pkgver}-$urlarch.tar.bz2 -C $pkgdir/opt/
  rm -r $pkgdir/opt/${pkgname/-bin/}-${pkgver}/share/{doc/mxml,man/man1/mxml*,man/man3/mxml*}
  cp -r $pkgdir/opt/${pkgname/-bin/}-${pkgver}/share $pkgdir/usr/share
  mkdir $pkgdir/usr/bin
  cd $pkgdir/usr/bin
  ln -s /opt/${pkgname/-bin/}-${pkgver}/bin/* ./
  rm mxmldoc
}
