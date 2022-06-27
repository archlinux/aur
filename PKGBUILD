# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=arch-update
pkgver=1.3.0
pkgrel=1
pkgdesc="A clickeable icon that automatically changes to act as an update notifier/applier"
arch=('any')
url="https://github.com/Antiz96/arch-update"
license=('GPL3')
depends=('pacman-contrib')
optdepends=('yay: AUR support'
	    'paru: AUR support'
	    'libnotify: Desktop notification support'
	   )
source=($url/archive/v$pkgver.tar.gz)
sha256sums=(a2aa7f5bfdc2fa19acd72cba27b517c3f12a68b69572048a98fae010f3cd3774)

package() {
  
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 755 "src/bin/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  mkdir -p "$pkgdir/usr/share/icons/$pkgname"
  install -Dm 666 "src/icons/$pkgname.svg" "$pkgdir/usr/share/icons/$pkgname/"
  install -Dm 666 "src/icons/"$pkgname"_checking.svg" "$pkgdir/usr/share/icons/$pkgname/"
  install -Dm 666 "src/icons/"$pkgname"_installing.svg" "$pkgdir/usr/share/icons/$pkgname/"
  install -Dm 666 "src/icons/"$pkgname"_up-to-date.svg" "$pkgdir/usr/share/icons/$pkgname/"
  install -Dm 666 "src/icons/"$pkgname"_updates-available.svg" "$pkgdir/usr/share/icons/$pkgname/"

  install -Dm 644 "src/desktop/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm 644 "src/systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  install -Dm 644 "src/systemd/$pkgname.timer" "$pkgdir/usr/lib/systemd/user/$pkgname.timer"

  install -Dm 644 "src/man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
