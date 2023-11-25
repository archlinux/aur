# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Spencer Harmon <spencer at rsitex dot com>

_pkgname=jackmidi2osc
pkgname=$_pkgname-git
pkgver=0.2.r4.g19b67b2
pkgrel=1
pkgdesc='Generate OSC messages triggered by JACK MIDI events (git version)'
arch=(x86_64)
url='https://github.com/x42/jackmidi2osc'
license=(GPL2)
groups=(pro-audio)
depends=(glibc)
makedepends=(git jack liblo)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/x42/jackmidi2osc.git")
sha256sums=('SKIP')

pkgver(){
  cd $_pkgname
  git describe --tags| sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  make
}

package() {
  depends+=(libjack.so liblo.so)
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -vDm 644 README.md cfg/*.cfg -t "$pkgdir"/usr/share/doc/$pkgname
}
