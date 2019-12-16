# Maintainer: X0rg
# Contributor: grmat <grmat@sub.red>

_realname=amdgpu-fancontrol
pkgname=$_realname-git
pkgver=r11.5461b36
pkgrel=1
pkgdesc="Control AMD Radeon graphics cards fan PWM"
arch=('any')
url="https://github.com/grmat/amdgpu-fancontrol"
license=('GPL')
backup=(etc/$_realname.cfg)
install=$_realname.install
depends=('systemd' 'bc')
provides=("$_realname")
conflicts=("$_realname")
source=("git+https://github.com/grmat/amdgpu-fancontrol.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_realname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_realname"
	install -Dvm644 "amdgpu-fancontrol.service" "$pkgdir/usr/lib/systemd/system/amdgpu-fancontrol.service"
	install -Dvm644 "etc-amdgpu-fancontrol.cfg" "$pkgdir/etc/amdgpu-fancontrol.cfg"
	install -Dvm755 "amdgpu-fancontrol" "$pkgdir/usr/bin/amdgpu-fancontrol"
}
