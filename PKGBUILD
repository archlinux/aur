# Maintainer: Lauri Niskanen <ape@ape3000.com>
# Contributor: George Gibbs <vash63 at gmail dot com>

pkgname=ds4drv
pkgver=0.5.1
pkgrel=3
pkgdesc="Sony DualShock 4 Userspace Driver"
arch=('any')
url="https://github.com/chrippa/ds4drv"
license=('MIT')
depends=(
    python-setuptools
    bluez-utils
    python-evdev
    python-pyudev
)
makedepends=('git')
conflicts=('ds4drv-git')
install=ds4drv.install
source=(https://github.com/chrippa/ds4drv/archive/v$pkgver.tar.gz)
sha256sums=('da6841c17af0fc019abfe9e65d3f2a6fab3ced40294dc7391dc3e954e04479f8')

package() { 
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -pm755 $pkgdir/etc/udev/rules.d
        cp udev/50-ds4drv.rules $pkgdir/etc/udev/rules.d/50-ds4drv.rules
	mkdir -pm755 $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
	python setup.py install --root="$pkgdir/" --optimize=1
	mkdir -pm755 $pkgdir/etc/systemd/system
	cp systemd/ds4drv.service $pkgdir/etc/systemd/system/ds4drv.service
	cp ds4drv.conf $pkgdir/etc/ds4drv.conf
}

# vim: ft=sh syn=sh
