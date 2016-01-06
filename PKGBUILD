# Maintainer: Colin Pitrat <colin dot pitrat at gmail dot com>
pkgname=caprice32-git
pkgver=r18.2aa01a6
pkgrel=1
pkgdesc="An emulator of the Amstrad CPC 8bit home computer range (CPC 464, 664, 6128)"
arch=('i686' 'x86_64')
url="https://github.com/ColinPitrat/caprice32"
license=('GPL2')
depends=('sdl' 'zlib' 'gcc-libs')
source=(git://github.com/ColinPitrat/caprice32)
sha256sums=('SKIP')

pkgver() {
  cd caprice32
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd caprice32
  make RELEASE=true
  sed -i 's,rompath=.*,rompath=/usr/share/caprice32/rom/,' cap32.cfg
}

package() {
  cd caprice32
  mkdir -p $pkgdir/usr/share/caprice32/rom
  cp rom/* $pkgdir/usr/share/caprice32/rom/
  #mkdir -p $pkgdir/usr/share/caprice32/resource
  #cp resource/* $pkgdir/usr/share/caprice32/rom/
  install -Dm755 cap32.cfg "$pkgdir/etc/cap32.cfg"
  install -Dm755 cap32 "$pkgdir/usr/bin/cap32"
}
