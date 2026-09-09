# Maintainer: Elven Inquisition <no.one.expects@faerie.me>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-menu
pkgver=22.04.2
pkgrel=5
pkgdesc="Advanced menu for MATE Panel, a fork of MintMenu"
arch=('any')
url="https://github.com/ubuntu-mate/mate-menu"
license=('GPL-2.0-or-later')
depends=('mate-panel' 'python-configobj' 'python-gobject' 'python-pyinotify' 'python-xdg' 'python-xlib' 'xdg-utils' 'python-setproctitle' 'mate-menus' 'python-cairo')
makedepends=('python-distutils-extra' 'python-setuptools')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/ubuntu-mate/mate-menu/archive/$pkgver.tar.gz"
	'0001-applications-fixed-disconnection.patch'
	'0002-mate-menu-cleaning-tooltipsWidgets.patch'
	'0003-execute-Save-and-restore-working-directory-when-laun.patch'
)
sha256sums=(
	'36aa865b72664b8cc90d9c1c429fd3c44e2c198369aae4eaaa87228a5add075c'
	'875b2e8108a5d4ab588a9caf515d77bef390ff46ba20a77068dcbb00d567dca9'
	'79563489b7f8ed66f811fd48c1061d44b1cc1c1e1b1723b2cc586b3d52a4f931'
	'ffb04e678de1f257d8ca5e3448320a60daabb8df51986b73b3eaff308d51782e'
)
install=$pkgname.install

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np1 -i ../0001-applications-fixed-disconnection.patch
	patch -Np1 -i ../0002-mate-menu-cleaning-tooltipsWidgets.patch
	patch -Np1 -i ../0003-execute-Save-and-restore-working-directory-when-laun.patch
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
