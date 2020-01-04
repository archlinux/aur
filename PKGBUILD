# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Zack Emmert <zemmert@fastmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Former Maintainer: sundar_ima <feedback.multibootusb@gmail.com>
# Former Maintainer: Angel_Caido <geussepe at gmail dot com>

pkgname=multibootusb
pkgver=9.2.0
pkgrel=4
pkgdesc="Boot multiple live Linux distros from a usb flash drive."
arch=("any")
url="http://multibootusb.org"
license=("GPL")
depends=("python-pyqt5" "python-dbus" "mtools" "util-linux" "parted" "p7zip" "python-six" "python-pyudev")

sha512sums=("461ce6edd835b2a017d96c3987338cd9004894949ac0b121fc289d100b7945dd89970f966e48310b97f312221a2f5a047190c55802d3a07a9eec0bf6ec22356d")
source=("https://github.com/mbusb/$pkgname/archive/v${pkgver}.tar.gz")

package () {
    cd "$srcdir/$pkgname-$pkgver"
    chmod 755 "$srcdir/$pkgname-$pkgver/data/multibootusb.desktop"
    python3 setup.py install --root="$pkgdir/" --optimize=1
    sed -i 's/\/usr\/local\/bin/\/usr\/bin/' "$pkgdir/usr/share/polkit-1/actions/org.debian.pkexec.run-multibootusb.policy"
}
