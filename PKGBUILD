# Maintainer: Mateusz Janczuk <devqore@gmail.com>
pkgname=adeskbar
pkgver=0.5
pkgrel=1
pkgdesc="application launcher"
arch=('any')
url="https://github.com/adcomp/adeskbar-0.5"
license=('GPL')
depends=('python2' 'pygtk' 'python2-xdg' 'gnome-menus')
makedepends=('git')
source=("adeskbar.sh"
        "remove_launcher_menu.patch"
        "$pkgname::git://github.com/adcomp/adeskbar-0.5#commit=7af984724eecc31ed9634457d73b5922d087729b")
sha256sums=('09721d988333375f0b5bf143ea10482f17ec8f0738250d8f95629367b566d6b5'
            '56035b72a1e4c65ffdaf87657f2a798b45cc0e3a9837897404f2adbd741cbe38'
            'SKIP')

package() {
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -R "$srcdir/$pkgname/src/"* "$pkgdir/usr/share/$pkgname"
  patch "$pkgdir/usr/share/$pkgname/default.cfg" < "$srcdir/remove_launcher_menu.patch"
  install -Dm755 "$srcdir/adeskbar.sh" "$pkgdir/usr/bin/adeskbar"
  install -Dm644 "$srcdir/$pkgname/adeskbar.desktop" "$pkgdir/usr/share/applications/adeskbar.desktop"
}
