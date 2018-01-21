# Maintainer: Light2Yellow <oleksii.vilchanskyi@gmail.com>

pkgname=ckb-next
pkgver=0.2.9
pkgrel=1
pkgdesc="Corsair Keyboard and Mouse Input Driver, release version"
arch=('i686' 'x86_64')
url="https://github.com/mattanger/ckb-next"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git')
optdepends=('libappindicator-gtk2: Ayatana indicators in Unity, KDE or Systray (GTK+ 2 library)'
            'libappindicator-gtk3: Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library)')
conflicts=('ckb-git' 'ckb-git-latest' 'ckb-next')
provides=('ckb-next')
install=ckb-next.install
source=("https://github.com/ckb-next/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('6e1da1f4ee5f1e9132f92ec7ad268499')

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

  install -Dm644 usr/ckb.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/ckb.png"
  install -Dm644 usr/ckb.desktop "$pkgdir/usr/share/applications/ckb.desktop"

  install -Dm644 service/systemd/ckb-daemon.service "$pkgdir/usr/lib/systemd/system/ckb-daemon.service"
  install -Dm644 udev/99-ckb-daemon.rules "$pkgdir/etc/udev/rules.d/99-ckb-daemon.rules"
}
