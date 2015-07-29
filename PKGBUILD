# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='profile-sync-daemon'
pkgver=5.75
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
sha256sums=('ecb9acc0f274eb645b7dcb0510f692194feda8dbeffa3bb2834ce91cba76fcf6')

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
