# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: Swift Geek <swift geek a t g mail dot com>

pkgname=fped-git
_pkgname=fped
pkgver=a
pkgrel=1
pkgdesc="Footprint Editor for KiCad used by Qi Hardware developers"
arch=('i686' 'x86_64')
url='http://projects.qi-hardware.com/index.php/p/fped/'
license=('GPL2')
depends=('imagemagick' 'ttf-liberation' 'netpbm' 'gtk2' 'flex' 'transfig' 'desktop-file-utils')
makedepends=('git')
provides=('fped')
conflicts=('fped' 'fped-svn')
replaces=('fped' 'fped-svn')
install=fped.install
source=('git://projects.qi-hardware.com/fped.git'
        'fped.png'
        'fped.desktop')
md5sums=('SKIP'
         '378b510a463478d8a48272cdf1a69e51'
         'adb6d02938f257b44b54c0d7724e8968')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD # Github-like shortened hash
}

build(){
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make  PREFIX=$pkgdir/usr install

  install -Dm644 ${srcdir}/fped.desktop ${pkgdir}/usr/share/applications/fped.desktop
  install -Dm644 ${srcdir}/fped.png ${pkgdir}/usr/share/pixmaps/fped.png
}

# vim:set ts=2 sw=2 et:
