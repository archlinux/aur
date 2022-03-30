# Maintainer: Robin Candau <robincandau at protonmail dot com>
pkgname=arch-update
pkgver=1.2
pkgrel=1
pkgdesc="A clickeable icon that automatically changes to act as an update notifier/applier"
arch=('any')
url="https://github.com/Antiz96/arch-update"
license=('GPL3')
depends=('pacman-contrib')
optdepends=('yay: AUR support'
	    'libnotify: Desktop notification support'
	   )
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=(5f59dc74732ee47aa34af5d93c0c24c677af7967074bbc99cf349a818c5cdfc1)

package() {
  
  cd "$srcdir"

  install -Dm 755 "bin/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  mkdir -p "$pkgdir/usr/share/icons/$pkgname"
  install -Dm 666 "icons/$pkgname.svg" "$pkgdir/usr/share/icons/$pkgname/"
  install -Dm 666 "icons/"$pkgname"_checking.svg" "$pkgdir/usr/share/icons/$pkgname/"
  install -Dm 666 "icons/"$pkgname"_installing.svg" "$pkgdir/usr/share/icons/$pkgname/"
  install -Dm 666 "icons/"$pkgname"_up-to-date.svg" "$pkgdir/usr/share/icons/$pkgname/"
  install -Dm 666 "icons/"$pkgname"_updates-available.svg" "$pkgdir/usr/share/icons/$pkgname/"

  install -Dm 644 "desktop/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm 644 "systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  install -Dm 644 "systemd/$pkgname.timer" "$pkgdir/usr/lib/systemd/user/$pkgname.timer"

  install -Dm 644 "man/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
