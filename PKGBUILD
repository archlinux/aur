# Maintainer: Guillaume DELVIT <guiguid@free.fr>

_pkgname=zram-init
pkgname=${_pkgname}-git
pkgver=9.0.r0.g2cb4dc3
pkgrel=1
pkgdesc="Sets up zram-based tmpfs and swap devices on boot"
arch=('any')
url="http://en.wikipedia.org/wiki/ZRam"
license=('GPL')
depends=('bash')
#backup=("modprobe.d/zram.conf")
source=(
	"$pkgname::git+https://github.com/vaeth/zram-init.git#branch=master"
)
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}" || exit 2
	set -o pipefail
	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 sbin/zram-init $pkgdir/usr/bin/zram-init
  install -Dm644 modprobe.d/zram.conf $pkgdir/etc/modprobe.d/zram.conf
  install -Dm644 systemd/system/zram_swap.service $pkgdir/usr/lib/systemd/system/zram_swap.service
  install -Dm644 systemd/system/zram_tmp.service $pkgdir/usr/lib/systemd/system/zram_tmp.service
  install -Dm644 systemd/system/zram_var_tmp.service $pkgdir/usr/lib/systemd/system/zram_var_tmp.service 
}
