# Maintainer: Jonathon Fernyhough <jonathon manjaro_dot_org>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-tweak
pkgver=19.10.0
_umsver=19.10.2
pkgrel=1
pkgdesc="Tweak tool for MATE (fork of MintDesktop)"
arch=('any')
url="https://github.com/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('gtk3' 'libnotify' 'mate-applets' 'python-configobj' 'python-gobject' 'python-psutil' 'python-setproctitle')
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
sha256sums=('883597c5f06c335e6937668ddc2d288c059f14b5686d17bd30b3b933ba4da823'
            '12e96fff448a4fa0a367e880f0875cd522bca2f5c59ed00c46c96193165856ad')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|/usr/lib/mate-applets/topmenu-mate-panel-applet|/usr/lib/topmenu-gtk/topmenu-mate-panel-applet|' mate-tweak
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  cp -r "$srcdir"/ubuntu-mate-settings-$_umsver/usr/share/mate-panel "$pkgdir/usr/share"
}
