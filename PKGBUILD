# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-no-title-bar
_upname=no-title-bar
pkgver=11
pkgrel=1
_fork=poehlerj
pkgdesc="Integrate maximized windows with the top panel ($_fork fork)"
arch=('any')
url="https://github.com/poehlerj/$_upname"
license=(GPL2)
depends=(gnome-shell xorg-xprop)
conflicts=(gnome-shell-extension-pixel-saver gnome-shell-extension-pixel-saver-git)
install=$pkgname.install
_prefix=V_
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_prefix$pkgver.tar.gz")
sha256sums=('7eb2383d0f2efce028b25f05330db2d4f6f1f28c71a35753a28974f473115cd7')

build() {
  cd "$_upname-$_prefix$pkgver"
  make _build
}

package() {
  cd "$_upname-$_prefix$pkgver"
  _extid="$_upname@$_fork.github.com"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  cp -af _build "$pkgdir/usr/share/gnome-shell/extensions/$_extid"
}
