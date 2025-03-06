# Maintainer: Bart Libert <bart plus aur at libert dot email>
_pkgname=headsetcontrol-notificationd-bash
pkgname=$_pkgname-git
pkgver=r4.95c43eb
pkgrel=1
pkgdesc='Headset battery notification daemon (rewritten in bash)'
arch=('any')
url='https://gitlab.com/simon.ingelsson/headsetcontrol-notificationd'
license=('GPL-3.0-only')
depends=('bash' 'headsetcontrol' 'libnotify')
makedepends=('git')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')
conflicts=('headsetcontrol-notificationd-git')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	sed -i "s@ExecStart=/usr/local/bin@ExecStart=/usr/bin@" headsetcontrol-notifyd.service
}

package() {
	cd "$_pkgname"
	install -Dvm755 headsetcontrol-notificationd  -t "$pkgdir/usr/bin/"
	install -Dvm644 headsetcontrol-notifyd.service  -t "$pkgdir/usr/lib/systemd/user"
}
