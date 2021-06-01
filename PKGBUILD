# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: tioguda <guda.flavio@gmail.com>
pkgname=slimbookbattery
pkgver=3.97beta
pkgrel=4
pkgdesc="A battery optimization application for portable devices"
arch=('x86_64')
url="https://slimbook.es"
license=('CC BY-NC-ND 3.0')
depends=('python-gobject' 'python-cairo' 'python-pillow' 'python-dbus'
         'libappindicator-gtk3' 'libnotify' 'tlp-rdw' 'cron' 'dmidecode'
         'xorg-xdpyinfo')
optdepends=('nvidia-prime: for hybrid graphics switching'
            'gnome-shell-extension-appindicator: for tray icon on GNOME')
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('8eda64d2207b01a8dd1f89b8234711c5ceeda516e0ead1de5dae1e5cb709bf13')

package() {
    bsdtar xf data.tar.xz -C "$pkgdir"

    install -d "$pkgdir/usr/lib/systemd/system"
    mv "$pkgdir/etc/systemd/system/suspend-sedation.service" \
    	"$pkgdir/usr/lib/systemd/system"
    rm -rf "$pkgdir/etc/systemd"

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    mv "$pkgdir/usr/share/doc/$pkgname/copyright" \
    	"$pkgdir/usr/share/licenses/$pkgname"
}
