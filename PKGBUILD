# Maintainer: X0rg
# Contributor: grmat <grmat@sub.red>

_pkgname=amdgpu-fancontrol
pkgname=$_pkgname-git
pkgver=r11.5461b36
pkgrel=1
pkgdesc="Control AMD Radeon graphics cards fan PWM"
arch=('any')
url="https://github.com/grmat/amdgpu-fancontrol"
license=('GPL')
depends=('systemd' 'bc')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname.cfg")
install="$_pkgname.install"
source=("git+https://github.com/grmat/amdgpu-fancontrol.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dvm644 "amdgpu-fancontrol.service" "$pkgdir/usr/lib/systemd/system/amdgpu-fancontrol.service"
	install -Dvm644 "etc-amdgpu-fancontrol.cfg" "$pkgdir/etc/amdgpu-fancontrol.cfg"
	install -Dvm755 "amdgpu-fancontrol" "$pkgdir/usr/bin/amdgpu-fancontrol"
}
