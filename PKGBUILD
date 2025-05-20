# Maintainer: Mus <sonics0977703996@gmail.com>
pkgname=lane-wd
pkgver=1.0
pkgrel=1
pkgdesc="Lane Launcher that use WayDroid"
arch=('any')
url="https://github.com/musdev13/lanewd"
license=('GPL3')
depends=('waydroid' 'android-tools' 'waydroid-image' 'xdg-utils' 'wget')
makedepends=('git')
conflicts=('lane-adb')
source=("lane-wd::git+https://github.com/musdev13/lane-wd.git")
md5sums=('SKIP')

package() {
	cd "$pkgname"
	install -Dm755 ./lane "$pkgdir/usr/bin/lane"
}

post_install(){
	waydroid init
	waydroid prop set persist.waydroid.multi_windows true
	waydroid session stop
	systemctl enable waydroid-container.service
	systemctl start waydroid-container.service
	lane update
	lane quit
}
