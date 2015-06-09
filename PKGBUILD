# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='profile-sync-daemon'
pkgver=5.74
pkgrel=1
pkgdesc='Syncs browser profiles to tmpfs reducing SSD/HDD calls and speeding-up browsers.'
arch=('any')
url='https://github.com/graysky2/profile-sync-daemon'
license=('MIT')
depends=('procps-ng' 'rsync')
conflicts=('firefox-sync' 'goanysync' 'go-anysync-git' 'iceweasel-sync'
'tmpfs-store' 'tmpfs-sync' 'user-profile-sync-daemon')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
backup=('etc/psd.conf')
install=psd.install
sha256sums=('765b2e9816d0f83748dfd903057a179ddb96d4a8cac818dad6b8dcbe25bc7730')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
	
	# note if you want to use openrc rather than systemd, change the below make
	# target to 'install-openrc-all' before building and be sure that you read
	# the INSTALL document provided in the source tarball!
  make DESTDIR="$pkgdir" install-systemd-all
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
