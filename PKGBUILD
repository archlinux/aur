# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=triceratops-lv2
pkgver=0.2.0
pkgrel=1
pkgdesc="Polyphonic synthesizer LV2 plugin"
arch=(i686 x86_64)
url="http://deliriumdecrypted.blogspot.com/"
license=('GPL3')
groups=('lv2-plugins')
depends=('gtkmm' 'lv2')
makedepends=('python2')
source=("http://downloads.sourceforge.net/project/triceratops/$pkgname-v$pkgver.tar.gz"
        "$pkgname-read-presets.patch")
md5sums=('0946acd2bcab02bf8f8d6e4ea4b0e2ab'
         '907c1d032eb888a2a69d0963720d6016')

prepare() {
  cd $pkgname-v$pkgver

  # let inner presets being discovered
  patch -p1 -i ../${source[1]}
}

build() {
  cd $pkgname-v$pkgver
  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd $pkgname-v$pkgver
  python2 waf install --destdir="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
