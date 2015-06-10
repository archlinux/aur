# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=promoe-git
pkgver=0.2.0
pkgrel=1
pkgdesc='XMMS2 client that looks like Winamp Classic'
url='https://github.com/dsvensson/promoe'
arch=('x86_64' 'i686')
license=('GPL2')
depends=('xmms2' 'qt5-base' 'avahi' 'boost' 'libarchive')
makedepends=('python2' 'git')
source=("git://github.com/dsvensson/promoe.git")
md5sums=('SKIP')

build() {
  cd "${pkgname/-git}"

  export CXXFLAGS="$CXXFLAGS -fpermissive"
  python2 waf configure --prefix="$pkgdir/usr" --qtbin=/usr/lib/qt4/bin
  python2 waf build
}

package() {
  cd "${pkgname/-git}"

  python2 waf install
  install -Dm644 data/icon.png "$pkgdir/usr/share/pixmaps/promoe.png"
  install -d "$pkgdir/usr/share/promoe"
  cp -r "data/skins" "$pkgdir/usr/share/promoe/skins"
} 

# vim:set ts=2 sw=2 et:
