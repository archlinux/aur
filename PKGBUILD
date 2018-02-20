# Fixed due to printproto being incorrectly succumbed into xorgproto
# (Succumed without any files being incorporated...sigh.)
# Maintainer: not_anonymous <nmlibertarian@gmail.com>

# Previous Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Ruslan Nabioullin <rnabioullin at gmail dot com>
# Contributor: Gordon JC Pearce <gordon at gjcp dot net>

pkgname=xastir-fix
_pkgname=xastir
pkgver=2.1.0
pkgrel=2
pkgdesc="HAM RADIO - Full featured APRS Tracking/Information Reporting System"
arch=('armv7h' 'i686' 'x86_64')
url="http://www.xastir.org/"
license=('GPL' 'LGPL')
depends=('python' 'openmotif' 'shapelib' 'libax25' 'gdal' 'graphicsmagick' 'libxpm' 'hamradio-menus')
optdepends=('festival: for speech systhesis')
makedepends=('autoconf' 'automake' 'printproto-fix')
conflicts=('xastir-cvs' 'xastir')
provides=('xastir')
replaces=('xastir')
source=(https://github.com/Xastir/Xastir/archive/Release-$pkgver.tar.gz
        https://github.com/Xastir/${_pkgname}-sounds/archive/v1.0.tar.gz
        ${_pkgname}.desktop
        ${_pkgname}-festival.desktop
        ${_pkgname}-speech
        ${_pkgname}.png)

build() {
  cd $srcdir/Xastir-Release-$pkgver
  ./bootstrap.sh
  ./configure --prefix=/usr
  
  sed -i -e s:doc/xastir:xastir/doc: Makefile
  
  make
}

package() {
  cd $srcdir/Xastir-Release-$pkgver
  make DESTDIR=$pkgdir install

  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps
  cd $srcdir
  install -m644 *.desktop $pkgdir/usr/share/applications/
  install -m644 *.png $pkgdir/usr/share/pixmaps/
  install -m755 ${_pkgname}-speech $pkgdir/usr/bin/
  rm $pkgdir/usr/share/${_pkgname}/sounds/*
  install -m644 $srcdir/${_pkgname}-sounds-1.0/sounds/* $pkgdir/usr/share/${_pkgname}/sounds/
  
  chmod 4755 $pkgdir/usr/bin/${_pkgname}
}
md5sums=('1b1abde576f2ebcd64695d1416c62af3'
         'c314946788a828d42d804670ad23e646'
         '2a06e041a0dc5f20c1427a130613d793'
         '2f8af994b7f5086d4ca2d951ced9019a'
         'e56e55a1c43038d4488fbdd429a0a755'
         '0a7269113052d3bd2711b84ff2fda9d6')
sha256sums=('a481e6a6c035954041904352ec58f52240c06874a30dfb810001da489d40f43a'
            'fd7b0d60386964b8a35ec2e504238d8393f9217e32607a6ddfaeac6bde7d4f4a'
            '555ee695b83e59ebd270a001d7947bad7c5168ea319d80a3dc7842981975f6ec'
            '3452ca25072da4ccbaad2a8f07a61f1685872e1874cd6b28e5e5571f734fb47b'
            'c99ef0816e0509b7549abdcc41253be2e50499345acd63a19b7b4a17396873b4'
            '4d140434ccadb2772a08a23543bf3692f413d88cb9a39e0a9cf8b8470230e8c6')
