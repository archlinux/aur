# Maintainer: milkii on freenode
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=qmidiarp-git
pkgver=0.6.5.r20.gd774efc
pkgrel=1
pkgdesc="A MIDI arpeggiator, phrase generator and controller LFO for the ALSA sequencer."
arch=(x86_64)
url="https://sourceforge.net/projects/qmidiarp/"
license=('GPL2')
groups=('lv2-plugins' 'pro-audio')
conflicts=('qmidiarp')
provides=('qmidiarp')
depends=('jack' 'hicolor-icon-theme' 'liblo' 'qt5-base')
makedepends=('lv2' 'qt5-tools')
source=("qmidiarp::git://git.code.sf.net/p/qmidiarp/code")
sha512sums=('SKIP')

pkgver() {
  cd "qmidiarp"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/qmidiarp.//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "qmidiarp"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "qmidiarp"
  make DESTDIR="${pkgdir}/" install
  install -vDm 644 {AUTHORS,ChangeLog,NEWS,README} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
