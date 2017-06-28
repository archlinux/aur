# Maintainer: Light2Yellow <alexvilchansky@yahoo.com>

pkgname=ckb-next
pkgver=0.2.8
pkgrel=1
pkgdesc="Corsair Keyboard and Mouse Input Driver, release version"
arch=('i686' 'x86_64')
url="https://github.com/mattanger/ckb-next"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git')
conflicts=('ckb-git' 'ckb-git-latest' 'ckb-next-git' 'ckb-next-latest-git')
install=ckb-next.install
source=("https://github.com/mattanger/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('bb2f354559fedc6883acc0a478e7e59a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./qmake-auto
  make -j$(nproc --all)
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/lib/ckb-animations"
  install -Dm755 bin/ckb{,-daemon} "$pkgdir/usr/bin/"
  install -D bin/ckb-animations/* "$pkgdir/usr/lib/ckb-animations/"

  install -Dm644 usr/ckb.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/ckb.png"
  install -Dm644 usr/ckb.desktop "${pkgdir}/usr/share/applications/ckb.desktop"

  install -Dm644 service/systemd/ckb-daemon.service "${pkgdir}/usr/lib/systemd/system/ckb-daemon.service"
}
