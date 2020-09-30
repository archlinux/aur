# Maintainer: Jonathon Fernyhough <jonathon+m2x dev>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-tweak
pkgver=20.10.0
_umsver=20.10.0
pkgrel=1
pkgdesc="Tweak tool for MATE (fork of MintDesktop)"
arch=('any')
url="https://github.com/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('gtk3' 'libnotify' 'mate-applets' 'python-configobj' 'python-distro' 'python-gobject' 'python-psutil' 'python-setproctitle')
makedepends=('python-distutils-extra' 'python-setuptools')
optdepends=('brisk-menu: for Manjaro panel layout'
            'mate-applet-dock: for Mutiny panel layout'
            'mate-menu: to enable advanced menu'
            'mate-netbook: for Netbook panel layout'
            'plank: for Cupertino panel layout'
            'synapse: to enable launcher'
            'tilda: to enable pull-down terminal'
            'topmenu-gtk: for Mutiny panel layout'
            'vala-panel-appmenu-mate: for Mutiny,Cupertino')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ubuntu-mate/$pkgname/archive/$pkgver.tar.gz"
        "ubuntu-mate-settings-$_umsver.tar.gz::https://github.com/ubuntu-mate/ubuntu-mate-settings/archive/$_umsver.tar.gz")
sha256sums=('8231a0ca9636dc7695e39a00d09d6bb82eaf78757e434b4943133e4e1ff6d58a'
            '0341adebcf2b0634d91db29978312b40afecc2696b6d2c1d50cf7fc59186916e')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|/usr/lib/mate-applets/topmenu-mate-panel-applet|/usr/lib/topmenu-gtk/topmenu-mate-panel-applet|' mate-tweak
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  cp -r "$srcdir"/ubuntu-mate-settings-$_umsver/usr/share/mate-panel "$pkgdir/usr/share"
}
