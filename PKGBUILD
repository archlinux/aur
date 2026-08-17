# Maintainer: Maxwell Pray <synthead@gmail.com>

_pkgname=xautocfg
pkgname=$_pkgname-git
pkgver=v1.2.r4.gf226174
pkgrel=1
arch=('x86_64')
url='https://github.com/SFTtech/xautocfg'
conflicts=('xautocfg')
license=('GPL3')
pkgdesc='Automatic keyboard repeat rate configuration for new keyboards'
depends=('libx11' 'libxi' 'xorgproto')
makedepends=('git')
source=("git+https://github.com/SFTtech/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  make
}

package() {
  cd "$_pkgname"

  install -Dm 755 xautocfg "$pkgdir/usr/bin/xautocfg"
  install -Dm 644 xautocfg.1 "$pkgdir/usr/share/man/man1/xautocfg.1"
  install -Dm 644 etc/xautocfg.service "$pkgdir/usr/lib/systemd/user/xautocfg.service"
  install -Dm 644 etc/xautocfg.cfg "$pkgdir/usr/share/doc/$_pkgname/examples/xautocfg.cfg"
}
