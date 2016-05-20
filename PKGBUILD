# Maintainer: Ray Rashif <schiv@archlinux.org>
# Maintainer: speps <speps at aur dot archlinux dot org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: clarence <catchfire at gmail dot com>

pkgname=patchage
pkgver=1.0.0
pkgrel=4
pkgdesc="A modular patch bay for audio and MIDI systems based on Jack and Alsa"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/patchage"
license=('GPL3')
depends=('ganv' 'jack')
makedepends=('boost' 'python2')
source=("http://download.drobilla.net/$pkgname-$pkgver.tar.bz2")
md5sums=('d16a3fc045faff7fd70f3b4769b65698')

prepare() {
  cd $pkgname-$pkgver

  # FS#40311
  # disable jack metadata support for jack2 capability
  sed -i '/jack_get_property/,/False/d' wscript
}

build() {
  cd $pkgname-$pkgver
  python2 waf configure --prefix=/usr
  python2 waf build $MAKEFLAGS
}

package() {
  cd $pkgname-$pkgver
  python2 waf install --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
