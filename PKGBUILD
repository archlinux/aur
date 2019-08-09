# Maintainer: Ryan O'Beirne <ryanobeirne@gmail.com>

pkgname=xbox-generic-controller
pkgver=0.1.0
pkgrel=1
pkgdesc="Fix for generic XBox-like USB gamepads that are recognized but not functional"
arch=("any")
url="https://gitlab.com/ryanobeirne/xbox-generic-controller"
license=('MIT')
depends=("systemd" "python>=3" "python-pyusb" "xboxdrv")

source=(
	$pkgname.conf
	50_$pkgname.rules
	fixcontroller.py
)

sha256sums=(
	bdc54ef5b9728751f89f08039c69141f7515b9df723cbda1df0239c5109d249b
	ecb8c515f1b88fe4986eec098bd6863c459c39fd569d759884936e39d22d586b
	e9f41812137b2cdcf60bc47cc59a5ef5f23e3c467fa6f841b5d20f9abe30797a
)

package() {
	install -D "${source[0]}" "$pkgdir/etc/modprobe.d/${source[0]##*/}"
	install -D "${source[1]}" "$pkgdir/etc/udev/rules.d/${source[1]##*/}"
	install -D "${source[2]}" "$pkgdir/usr/bin/${source[2]##*/}"
}
