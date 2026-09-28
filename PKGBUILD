# Maintainer: Scott Hansen (firecat53) tech at firecat53 dot net
_pkgname=networkmanager-dmenu
_gitname=networkmanager-dmenu
pkgname=$_pkgname-git
pkgver=r284.2466972
pkgrel=1
pkgdesc="Control NetworkManager via dmenu"
arch=('any')
url="https://github.com/firecat53/networkmanager-dmenu"
license=('MIT')
depends=('python' 'networkmanager' 'python-gobject')
makedepends=('git')
optdepends=('dmenu: dmenu backend'
            'bemenu: bemenu backend'
            'fuzzel: fuzzel backend'
            'rofi: rofi backend'
            'tofi: tofi backend'
            'walker: walker backend'
            'wmenu: wmenu backend'
            'wofi: wofi backend'
            'yofi: yofi backend'
            'nm-connection-editor: for connection manager GUI'
            'libnotify: any notification platform (dunst, for example)'
            'pinentry: secure passphrase entry'
            'modemmanager: WWAN support'
            'bluez: bluetooth control')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/firecat53/$_gitname.git")
md5sums=('SKIP')
install="$_pkgname.install"

prepare() {
  git -C "$_gitname" clean -dfx
}

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "$srcdir/$_pkgname/networkmanager_dmenu" "$pkgdir/usr/bin/networkmanager_dmenu"
  install -Dm644 "$srcdir/$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/$_pkgname/config.ini.example" "$pkgdir/usr/share/doc/$pkgname/config.ini.example"
  install -Dm644 "$srcdir/$_pkgname/networkmanager_dmenu.desktop" "$pkgdir/usr/share/applications/networkmanager_dmenu.desktop"
}

# vim:set ts=2 sw=2 et:
