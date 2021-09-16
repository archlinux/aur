# Maintainer: Raymond Li <aur@raymond.li>
# Contributor: Mark Wagie <mark.wagie at tutanota dot com
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Andriy Kovtun <kovtunos@yandex.ru>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>
pkgname=x-tile
pkgver=3.3
pkgrel=3
pkgdesc="Allows you to select a number of windows and tile them in different ways (Fancyzones for Linux)"
arch=('any')
url="https://www.giuspen.com/x-tile"
license=('GPL2')
depends=('gtk3' 'python-gobject' 'python-cairo' 'python-prctl')
checkdepends=('desktop-file-utils' 'appstream-glib')
optdepends=('libappindicator-gtk3: Tray icon support')
source=("http://www.giuspen.com/software/$pkgname-$pkgver.tar.xz"
        "$pkgname.appdata.xml")
sha256sums=('a79c7515719ce8a894b21fee7bc89d9266ecbeb014105af8c8f1108455a7f1f6'
            'a9c22562ba580ed58f2a88925cf1032c4beea9236a499a75545709a2695f15f1')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  desktop-file-validate "linux/$pkgname.desktop"
  appstream-util validate-relax --nonet "$srcdir/$pkgname.appdata.xml"
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 "$srcdir/$pkgname.appdata.xml" -t "$pkgdir/usr/share/metainfo"
}
