# Maintainer: Liganic <liganic-aur@gmx.net>
pkgname=ckb-git
pkgver=v0.2.r0.gdfc4b15
pkgrel=1
pkgdesc="Corsair Keyboard Input Driver (K65 RGB, K70[RGB], K95[RGB], M65 RGB)"
arch=('i686' 'x86_64')
url="https://github.com/ccMSC/ckb"
license=('GPL2')
depends=('qt5-base')
makedepends=('git')
replaces=('ckb-git-latest')
install=ckb-git.install
source=('ckb-git::git://github.com/ccMSC/ckb.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/${pkgname%-VCS}"
  qmake
  make
}

package() {
  cd "$srcdir/${pkgname%-VCS}"
  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 bin/ckb{,-daemon} "$pkgdir/usr/bin/"

  install -dm755 "$pkgdir/opt/ckb/ckb-animations"
  install -D bin/ckb-animations/* "$pkgdir/opt/ckb/ckb-animations/"
  
  install -Dm644 usr/ckb.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/ckb.png"
  install -Dm644 usr/ckb.desktop "${pkgdir}/usr/share/applications/ckb.desktop"

  install -Dm644 service/systemd/ckb-daemon.service "${pkgdir}/usr/lib/systemd/system/ckb-daemon.service"
}
